import 'package:finnhub_news/core/constants/app_strings.dart';
import 'package:finnhub_news/core/extensions/loading.dart';
import 'package:finnhub_news/core/global_config.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/news_details_webview/data/blog_web_view_data.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/widgets/custom_app_bar.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/widgets/empty_list.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/widgets/shimmer_list.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/widgets/single_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../application/blocs/news_impl/news_impl_bloc.dart';
import '../../../../../application/routes/app_route_config.dart';
import '../../../../../core/constants/enums/processing_status.dart';
import '../../../../../core/constants/enums/status.dart';
import '../../../../../domain/models/news_model/news.dart';
import '../../../../core/components/toast_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = "";

  @override
  void initState() {
    super.initState();
    fetchNews();
    fetchFirstName();
  }

  void fetchFirstName() {
    final String fullName =
        GlobalConfig.storageService.getStringValue(AppStrings.USER_NAME);
    setState(() {
      firstName = fullName.split(" ")[0];
    });
  }

  void fetchNews() {
    context.read<NewsImplBloc>().add(RetrieveNews());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocConsumer<NewsImplBloc, NewsImplState>(
        listener: (context, state) {
          if (state.processingStatus == ProcessingStatus.waiting) {
            // context.showLoader();
          } else if (state.processingStatus == ProcessingStatus.error) {
            context.hideLoader();
            toastInfo(
              msg: 'Ops! ${state.error.errorMsg}',
              status: Status.error,
            );
          } else if (state.processingStatus == ProcessingStatus.success) {
            // context.hideLoader();
            toastInfo(
              msg: 'Fetched news successfully.',
              status: Status.success,
            );
            // context.hideLoader();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: CustomAppBar(
                firstName: firstName,
                state: state,
              ),
            ),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              child: state.processingStatus == ProcessingStatus.success
                  ? ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        final News news = state.news[index];
                        DateTime date = DateTime.fromMillisecondsSinceEpoch(
                            news.datetime * 1000);

                        String formattedDate =
                            DateFormat('dd MMMM yyyy').format(date);

                        return GestureDetector(
                          onTap: () {
                            // context.pushNamed(
                            //   AppRoutes.detailsScreen,
                            //   extra: news,
                            // );

                            context.pushNamed(
                              AppRoutes.detailsWebViewScreen,
                              extra: WebViewData(
                                  title: "News from ${news.source}",
                                  url: news.url),
                            );
                          },
                          child: SingleNews(
                            news: news,
                            formattedDate: formattedDate,
                          ),
                        );
                      },
                    )
                  : state.processingStatus == ProcessingStatus.waiting
                      ? NewsListShimmer()
                      : EmptyListMsg(
                          msg: "Ops! An error occurred!",
                        ),
            ),
          );
        },
      ),
    );
  }
}
