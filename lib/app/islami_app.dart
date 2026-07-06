import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/home/view/home_app_view.dart';
import 'package:islami_app/features/splash/view/splash_view.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget Function(BuildContext)> routeApp = <String, WidgetBuilder>{
      SplashView.routeName : (context) => const SplashView(),
      HomeAppView.routeName:(context) => const HomeAppView(),
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
