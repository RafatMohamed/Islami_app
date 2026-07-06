import 'package:flutter/material.dart';

class AppThem{
  static const Color blackColor =Color(0xff202020);
  static const Color goldColor =Color(0xffE2BE7F);
  static const Color grayColor =Color(0xff707070);
  static const Color whiteColor =Color(0xffffffff);
  static const Color offWhiteColor =Color(0xffFFF5E3);
  static const Color brownColor =Color(0xff946107);

  static final ThemeData theme =ThemeData(
    primaryColor: whiteColor
  );

  static final ThemeData darkTheme =ThemeData(
    primaryColor: blackColor
  );
}