import 'package:flutter/material.dart';

class AppThem{
  static final ThemeData theme =ThemeData(
    primaryColor: AppColor.whiteColor
  );

  static final ThemeData darkTheme =ThemeData(
    primaryColor: AppColor.blackColor,
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
}

class AppText{
  static const String appName = "Islami";
  static const String routeHomeApp = "/homeApp";
}

