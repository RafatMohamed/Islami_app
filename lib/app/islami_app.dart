import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/quran_view/view/quran_view.dart';
import 'package:islami_app/features/soura_detailes_view/view/widget.dart';
import 'package:islami_app/features/splash/view/splash_view.dart';
import '../features/hadeth_view/view/hadeth_view.dart';
import '../features/main_app_view/view/main_app_view.dart';
import '../features/on_boarding/view/on_boarding_view.dart';
import '../features/radio_view/view/radio_view.dart';
import '../features/sebha_view/view/sebha_view.dart';
import '../features/time_view/view/time_view.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget Function(BuildContext)> routeApp = <String, WidgetBuilder>{
      SplashView.routeName : (context) => const SplashView(),
      OnBoardingView.routeName : (context) => const OnBoardingView(),
      MainAppView.routeName:(context) => const MainAppView(),
      QuranView.routeName:(context) => const QuranView(),
      HadethView.routeName:(context) => const HadethView(),
      SebhaView.routeName:(context) => const SebhaView(),
      RadioView.routeName:(context) => const RadioView(),
      TimeView.routeName:(context) => const TimeView(),
      SuraDetailsView.routeName:(context) => const SuraDetailsView(),
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
