import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_assets.dart';
import '../../../core/style/app_text_style.dart';
import '../../../core/style/color.dart';

class CustomTopHeadWidgets extends StatelessWidget {
  const CustomTopHeadWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/${AppAssets.homeScreenTopImage}",
          width: double.infinity,
          height: 270.h,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: 30.sp,
            bottom: 20.sp,
            left: 30.sp,
            child: Container(
              height: 186.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: AppColors.Primarycolor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Center(
                child: Text(
                  "Welcome \nAdd A New Recipe",
                  textAlign: TextAlign.start,
                  style: AppTextStyle.onBoardingTitleStyle,
                ),
              ),
            ))
      ],
    )
    ;
  }
}
