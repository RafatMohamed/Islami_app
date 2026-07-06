import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThem.theme,
      darkTheme: AppThem.darkTheme,
      themeMode:ThemeMode.dark,
    );
  }
}
