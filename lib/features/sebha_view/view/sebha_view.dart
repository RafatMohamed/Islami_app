import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/sebha_view/view/widget/sebha_body_view.dart';

class SebhaView extends StatelessWidget {
  static const String routeName = "/${AppText.sebhaViewApp}";
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tasbeh = [
      "سبحان الله",
      "الحمد لله",
      "الله أكبر",
      "لا إله إلا الله",
      "لا حول ولا قوة إلا بالله",
      "سبحان الله وبحمده",
      "سبحان الله العظيم",
      "أستغفر الله",
      "اللهم صلِّ على محمد",
      "حسبي الله ونعم الوكيل",
      "اللهم اغفر لي",
      "اللهم ارحمني",
      "رب اغفر لي",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical:  AppPadding.p32,),
      child: SebhaBodyView(
        tasbeh:tasbeh,
      ),
    );
  }
}
