import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/style/app_assets.dart';
import 'package:meal_app_2/core/style/app_text_style.dart';
import 'package:meal_app_2/core/style/color.dart';
import 'package:meal_app_2/feature/home_screen/home_screen.dart';

import '../../core/widgets/spacing_widgets.dart';
import 'onboarding_service/onboarding_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> title = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    " Our App Your Ultimate Choice"
  ];
  List<String> describe = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    " All the best restaurants and their top menus are ready for you"
  ];
  CarouselSliderController carouselController = CarouselSliderController();
  int initialPage = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirstTime = OnboardingService.isFirstTime();
      log(isFirstTime.toString());
      if (isFirstTime == false) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      }
      OnboardingService.setFirstTimeWithFalse();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/${AppAssets.onBoarding_background}"),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
                bottom: 40.h,
                right: 32.w,
                left: 32.w,
                top: 372.h,
                child: Container(
                  width: 311.w,
                  height: 400.h,
                  padding: EdgeInsets.all(30.sp),
                  decoration: BoxDecoration(
                    color: AppColors.Primarycolor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(48.r),
                  ),
                  child: Column(
                    children: [
                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 230.h,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          initialPage: initialPage,
                          onPageChanged: (index, reason) {
                            setState(() {
                              initialPage = index;
                            });
                          },
                        ),
                        items: List.generate(
                          title.length,
                          (index) {
                            return SizedBox(
                              width: 252.w,
                              child: Column(
                                children: [
                                  Text(
                                    title[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.onBoardingTitleStyle,
                                  ),
                                  HeightSpacing(16.h),
                                  Text(
                                    describe[index],
                                    textAlign: TextAlign.center,
                                    style:
                                        AppTextStyle.onBoardingDescriptionStyle,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      HeightSpacing(1.h),
                      DotsIndicator(
                        dotsCount: 3,
                        position: initialPage.toDouble(),
                        onTap: (position) {
                          initialPage = position;
                          setState(() {
                            carouselController.animateToPage(initialPage);
                          });
                        },
                        animate: true,
                        decorator: DotsDecorator(
                          size: Size(24.w, 6.h),
                          activeSize: Size(24.w, 6.h),
                          activeColor: Colors.white,
                          color: Color(0xffC2C2C2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r)),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r)),
                        ),
                      ),
                      Spacer(),
                      initialPage == 2
                          ? SizedBox(
                              width: 62.w,
                              height: 62.h,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                                },
                                child: Container(
                                  width: 62.w,
                                  height: 62.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 25.sp,
                                    color: AppColors.Primarycolor,
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ));
                                  },
                                  child: Text(
                                    "Skip",
                                    style: AppTextStyle.grey14regular
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    initialPage++;
                                    setState(() {
                                      carouselController
                                          .animateToPage(initialPage);
                                    });
                                  },
                                  child: Text(
                                    "Next",
                                    style: AppTextStyle.grey14regular
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
