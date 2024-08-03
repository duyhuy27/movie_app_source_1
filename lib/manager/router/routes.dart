import 'package:flutter/material.dart';
import 'package:huynd2_assignment/manager/router/main_wrapper.dart';
import 'package:huynd2_assignment/manager/router/routes_name.dart';
import 'package:huynd2_assignment/presentation/auth/login/login_screen.dart';
import 'package:huynd2_assignment/presentation/auth/register/register_screen.dart';
import 'package:huynd2_assignment/presentation/explore/explore_screen.dart';
import 'package:huynd2_assignment/presentation/explore/search_keyword_result_screen.dart';
import 'package:huynd2_assignment/presentation/home/home_screen.dart';
import 'package:huynd2_assignment/presentation/splash/splash_screen.dart';

class MovieDetailParam {
  final int movieId;

  MovieDetailParam({required this.movieId});
}

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (BuildContext context) => const RegisterScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
        case RoutesName.explore:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchScreen());
      case RoutesName.searchKeyword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchKeywordResultScreen());
      case RoutesName.main:
        return MaterialPageRoute(builder: (BuildContext context) => const MainWrapper());
      // case RoutesName.detail:
      //   final args = routeSettings.arguments as MovieDetailParam;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => MovieDetailScreen(movieId: args.movieId));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: Center(child: Text('Not Found'))));
    }
  }
}
