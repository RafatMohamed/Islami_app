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
  static const TextStyle textLabelOnBoardingStyle = TextStyle(
      fontFamily: "Janna",
      fontSize: 24,
      color: AppColor.goldColor,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textS20Style = TextStyle(
      fontFamily: "Janna",
      fontSize: 20,
      color: AppColor.goldColor,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textS16Style = TextStyle(
      fontFamily: "Janna",
      fontSize: 16,
      color: AppColor.goldColor,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textS14Style = TextStyle(
      fontFamily: "Janna",
      fontSize: 14,
      color: AppColor.goldColor,
      fontWeight: FontWeight.bold
  );
}

class AppText{
  static const String appName = "Islami";
  static const String routeMainApp = "MainApp";
  static const String routeOnBoardingApp = "onBoarding";
  static const String quranViewApp = "quranViewApp";
  static const String hadethViewApp = "hadethViewApp";
  static const String sebhaViewApp = "sebhaViewApp";
  static const String radioViewApp = "radioViewApp";
  static const String timeViewApp = "timeViewApp";
  static const String suraDetailsViewApp = "suraDetailsViewApp";


  static const String quran = "Quran";
  static const String hadeth = "Hadeth";
  static const String sebha = "Sebha";
  static const String radio = "Radio";
  static const String time = "Time";


  static const String label12ONBoarding = "Welcome To Islami App";
  static const String label3ONBoarding = "Reading the Quran";
  static const String label4ONBoarding = "Bearish";
  static const String label5ONBoarding = "Holy Quran Radio";

  static const String desc2ONBoarding = "We Are Very Excited To Have You In Our Community";
  static const String desc3ONBoarding = "Read, and your Lord is the Most Generous";
  static const String desc4ONBoarding = "Praise the name of your Lord, the Most High";
  static const String desc5ONBoarding = "You can listen to the Holy Quran Radio through the application for free and easily";


  static const String next = "Next";
  static const String back = "back";
  static const String skip = "Skip";
  static const String finish = "Finish";
  static const String suraList = "Suras List";

}

class AppPadding{
  static const double p4=4.0;
  static const double p8=8.0;
  static const double p10=10.0;
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
