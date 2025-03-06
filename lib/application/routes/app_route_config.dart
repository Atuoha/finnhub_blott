import 'package:finnhub_news/presentation/application/screens/authentication/continuation/continuation_screen.dart';
import 'package:finnhub_news/presentation/application/screens/authentication/login/login_screen.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/news_details_webview/data/blog_web_view_data.dart';
import 'package:finnhub_news/presentation/application/screens/main/home/news_details_webview/news_details_webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_strings.dart';
import '../../core/global_config.dart';
import '../../domain/models/news_model/news.dart';
import '../../presentation/application/screens/main/details/news_details.dart';
import '../../presentation/application/screens/main/home/home_screen.dart';
import '../../presentation/splash/entry.dart';

class AppRoutes {
  static const String entryScreen = 'entry';
  static const String loginScreen = 'login';
  static const String continueScreen = "continue";
  static const String homeScreen = 'home';
  static const String detailsScreen = 'details';
  static const String detailsWebViewScreen = 'detailsWebView';
}

GoRouter? globalGoRouter;
bool initialRoutingComplete = false;
GoRouter getGoRouter() {
  return globalGoRouter ??= AppRouteConfig.router;
}

class AppRouteConfig {
  static final GoRouter router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: AppRoutes.entryScreen,
          builder: (BuildContext context, GoRouterState state) {
            if(!initialRoutingComplete){
              entryFunction(context);
            }
            return const EntryScreen();
          },
          routes: [
            GoRoute(
              path: '/${AppRoutes.loginScreen}',
              name: AppRoutes.loginScreen,
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: '/${AppRoutes.continueScreen}',
              name: AppRoutes.continueScreen,
              builder: (BuildContext context, GoRouterState state) {
                return const ContinuationScreen();
              },
            ),
          ]),
      GoRoute(
        path: '/${AppRoutes.homeScreen}',
        name: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: '/${AppRoutes.detailsScreen}',
            name: AppRoutes.detailsScreen,
            builder: (BuildContext context, GoRouterState state) {
              return  NewsDetailsScreen(news: state.extra as News,);
            },
          ),

          GoRoute(
            path: '/${AppRoutes.detailsWebViewScreen}',
            name: AppRoutes.detailsWebViewScreen,
            builder: (BuildContext context, GoRouterState state) {
              return  NewsDetailsWebViewScreen(webViewData: state.extra as WebViewData,);
            },
          ),

        ],
      ),
    ],
  );

  static Future<void> entryFunction(BuildContext context) {
    return Future.delayed(const Duration(seconds: 4), () {
      final bool isLoggedIn =
          GlobalConfig.storageService.getBoolValue(AppStrings.IS_AUTHENTICATED);

      final bool seenNotificationSection =
      GlobalConfig.storageService.getBoolValue(AppStrings.SEEN_NOTIFICATION_SECTION);

      if (context.mounted) {
        if (isLoggedIn) {
          if (seenNotificationSection) {
            context.pushReplacementNamed(AppRoutes.homeScreen);
          } else {
            context.pushReplacementNamed(AppRoutes.continueScreen);
          }
        } else {
          context.pushReplacementNamed(AppRoutes.loginScreen);
        }
      }
      initialRoutingComplete = true;
    });
  }

  static void clearAndNavigate(String path) {
    while (getGoRouter().canPop() == true) {
      getGoRouter().pop();
    }
    getGoRouter().pushReplacementNamed(path);
  }
}
