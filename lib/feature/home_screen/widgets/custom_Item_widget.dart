import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/model/data.dart';

import '../../../core/style/app_assets.dart';
import '../../../core/style/app_text_style.dart';
import '../../../core/style/color.dart';
import '../../../core/widgets/spacing_widgets.dart';
import '../../meal_details/meal_details.dart';

class CustomItemWidget extends StatelessWidget {
  String title;
  String imageurl;
  String rate;
  String time;
  void Function()? onTap;
  CustomItemWidget({
  super.key ,
   required  this.onTap,
  required this.time,
  required this.rate,
  required this.title,
     required this.imageurl,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 166.h,
        width: 152.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageurl,
                width: 153.w,
                height: 106.h,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Icon(Icons.error , color: Colors.red,),
              ),
              HeightSpacing(18.h),
              Text(title , style: AppTextStyle.black16regular,maxLines: 1,),
              HeightSpacing(18.h),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star , color: AppColors.Primarycolor,size: 20.sp,),
                      Text(rate.toString() , style: AppTextStyle.black12regular,)
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.watch_later , color: AppColors.Primarycolor,size: 20.sp,),
                      Text(time.toString() , style: AppTextStyle.black12regular,)
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
