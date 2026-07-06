import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/splash/view/splash_view.dart';
import '../features/main_app_view/view/main_app_view.dart';
import '../features/on_boarding/view/on_boarding_view.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget Function(BuildContext)> routeApp = <String, WidgetBuilder>{
      SplashView.routeName : (context) => const SplashView(),
      OnBoardingView.routeName : (context) => const OnBoardingView(),
      MainAppView.routeName:(context) => const MainAppView(),
  };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.appName,
      theme: AppThem.theme,
      darkTheme: AppThem.darkTheme,
      themeMode:ThemeMode.dark,
      routes:routeApp,
    );
  }
}
