import 'package:flutter/material.dart';

class AppThem{
  static final ThemeData theme =ThemeData(
    primaryColor: AppColor.whiteColor
  );

  static final ThemeData darkTheme =ThemeData(
    primaryColor: AppColor.blackColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.goldColor,
      showUnselectedLabels: false,
      type: .fixed,
    ),
    scaffoldBackgroundColor:AppColor.blackColor,
    fontFamily:"KamaliOTF",
  );
}

class AppColor{
  static const Color blackColor =Color(0xff202020);
  static const Color goldColor =Color(0xffE2BE7F);
  static const Color grayColor =Color(0xff707070);
  static const Color whiteColor =Color(0xffffffff);
  static const Color offWhiteColor =Color(0xffFFF5E3);
  static const Color brownColor =Color(0xff946107);
}

class AppTextStyle {
  static const TextStyle textSplashStyle = TextStyle(
    color: AppColor.goldColor,
    fontSize: 64,
    fontFamily: "KamaliOTF",
  );
  static const TextStyle textLabelNavBarStyle = TextStyle(
      fontFamily: "Janna",
      fontSize: 12,
      color: AppColor.whiteColor,
      fontWeight: FontWeight.bold
  );
}

class AppText{
  static const String appName = "Islami";
  static const String routeHomeApp = "/homeApp";


  static const String quran = "Quran";
  static const String hadeth = "Hadeth";
  static const String sebha = "Sebha";
  static const String radio = "Radio";
  static const String time = "Time";
}

class AppPadding{
  static const double p4=4.0;
  static const double p8=8.0;
  static const double p16=16.0;
  static const double p20=20.0;
  static const double p24=24.0;
  static const double p32=32.0;
}

class AppBorderRadius{
  static const double r8=8.0;
  static const double r16=16.0;
  static const double r24=24.0;
  static const double r32=32.0;
}
