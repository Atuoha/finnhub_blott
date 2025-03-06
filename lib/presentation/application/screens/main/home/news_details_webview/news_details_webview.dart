import 'package:finnhub_news/core/extensions/loading.dart';
import 'package:finnhub_news/core/theme/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/enums/status.dart';
import '../../../../../core/components/platform_icons.dart';
import '../../../../../core/components/toast_info.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'data/blog_web_view_data.dart';

class NewsDetailsWebViewScreen extends StatefulWidget {
  final WebViewData webViewData;

  const NewsDetailsWebViewScreen({
    required this.webViewData,
    super.key,
  });

  @override
  State<NewsDetailsWebViewScreen> createState() =>
      _NewsDetailsWebViewScreenState();
}

class _NewsDetailsWebViewScreenState extends State<NewsDetailsWebViewScreen> {
  late final WebViewController _controller;
  final UniqueKey _key = UniqueKey();

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  @override
  void initState() {
    context.showLoader();
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            toastInfo(
              msg: 'Loading news details...',
              status: Status.success,
            );
          },
          onPageFinished: (String url) {
            context.hideLoader();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.webViewData.url));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: const PlatformIcon(
              iosIcon: CupertinoIcons.chevron_left,
              androidIcon: Icons.arrow_back,
              color: Colors.white,
            ),
          );
        }),
        title: Text(
          widget.webViewData.title,
          style: getRegularStyle(color: Colors.white),
        ),
      ),
      body: WebViewWidget(
        key: _key,
        gestureRecognizers: gestureRecognizers,
        controller: _controller,
      ),
    );
  }
}
