import 'package:flutter/material.dart';
import '../../../../core/resources_app.dart';
import '../../../../generated/assets.dart';

class SebhaBodyView extends StatefulWidget {
  const SebhaBodyView({super.key, required this.tasbeh});
  final List<String> tasbeh;
  @override
  State<SebhaBodyView> createState() => _SebhaBodyViewState();
}

class _SebhaBodyViewState extends State<SebhaBodyView> {
  int count =0;
  int currentIndexZekr=0;
  double rotate=0;
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.sizeOf(context);
    return Column(
      children: [
        const Text(AppText.sabehName, style: AppTextStyle.textS36Style),

        Expanded(
          child: GestureDetector(
            onTap: () {
              count++;
              rotate +=2;
              if(count%31==0){
                currentIndexZekr++;
              }
              if(currentIndexZekr==widget.tasbeh.length ){
                currentIndexZekr=0;
                count=0;
                rotate=0;
              }
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Image.asset(Assets.images.pngImages.topSebhaImg.path,fit: .scaleDown,height: size.height*0.12),
                Stack(
                  alignment: .center,
                  children: [
                    Column(
                      mainAxisAlignment: .center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:40
                          ),
                          child: Text(widget.tasbeh[currentIndexZekr], style: AppTextStyle.textS36Style,textAlign: .center,),
                        ),
                        Text("$count", style: AppTextStyle.textS36Style),
                      ],
                    ),
                    Transform.rotate(
                      angle: rotate,
                      alignment: .center,
                      origin: const Offset(0, 0),
                      child: Image.asset(Assets.images.pngImages.sebhaBodyImage.path,
                        fit: .fill,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
