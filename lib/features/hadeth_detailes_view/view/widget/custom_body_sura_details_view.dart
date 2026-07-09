import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/features/hadeth_view/model/hadeth_model.dart';
import '../../../../generated/assets.dart';

class CustomBodyHadethDetails extends StatelessWidget {
  const CustomBodyHadethDetails({super.key, required this.hadeth});
  final HadethModel hadeth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p10,
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            mainAxisSize: .min,
            children: [
              Image.asset(
                Assets.images.pngImages.imgLeftCornerHome.path,
                height: 100,
                width: 100,
              ),
              Expanded(
                child: Text(
                  hadeth.title,
                  style: AppTextStyle.textS20Style,
                  overflow: .ellipsis,
                  maxLines: 3,
                  textDirection: .rtl,
                  textAlign: .center,
                ),
              ),
              Image.asset(
                Assets.images.pngImages.imgRightCornerDetails.path,
                height: 100,
                width: 100,
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                textAlign: .center,
                style: AppTextStyle.textS16Style,
                softWrap: true,
                textDirection: .rtl,
              ),
            ),
          ),
          Expanded(
            child: Text(
              hadeth.lastHadeth,
              textAlign: .center,
              style: AppTextStyle.textS16Style,
              softWrap: true,
              textDirection: .rtl,
            ),
          ),
          Image.asset(
            Assets.images.pngImages.mosque02.path,
            height: 50,
            width: size.width,
            alignment: .bottomCenter,
          ),
        ],
      ),
    );
  }
}
