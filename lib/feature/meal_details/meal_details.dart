import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/model/data.dart';
import 'package:meal_app_2/core/style/app_text_style.dart';
import 'package:meal_app_2/core/style/color.dart';
import 'package:meal_app_2/core/widgets/spacing_widgets.dart';

class MealDetails extends StatelessWidget {
  final ModelFood meal;

   const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Stack(
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(16.r),
                 child: CachedNetworkImage(
                   height: 327.h,
                   width: 359.w,
                   imageUrl: meal.ImageUrl,
                   errorWidget: (context, url, error) => Icon(Icons.error , color: Colors.red,),
                   fit: BoxFit.cover,
                 ),

               ),
               Positioned(
                 top: 20,
                   left: 15,
                   child: Container(
                     height:36.h ,
                     width: 36.w,
                   decoration: BoxDecoration(
                    border: Border.all(color: AppColors.Kwhite,width: 1.w),
                     borderRadius: BorderRadius.circular(100.r)
                   ),
                     child: Center(
                       child: IconButton(onPressed: () {

                       }, icon: Icon(Icons.arrow_back_ios,color: AppColors.Kwhite,)),
                     ),
                   )
               ),
               Positioned(
                   top: 20,
                   right: 15,
                   child: Container(
                     height:36.h ,
                     width: 36.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: AppColors.Kwhite,width: 1.w),
                         borderRadius: BorderRadius.circular(100.r)
                     ),
                     child: Center(
                       child: IconButton(onPressed: () {

                       }, icon: Icon(Icons.delete,color: AppColors.Kwhite,)),
                     ),
                   )
               )
             ],
           ),
         ),
          HeightSpacing(16.h),
          Padding(padding: EdgeInsets.only(left: 16.sp),
            child: Text(meal.title , style: AppTextStyle.black24regular,),
          ),
          HeightSpacing(21.h),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              width: 327.w,
              height: 35.h,
              color: Color(0xffFE8C000A).withOpacity(0.15),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star , color: AppColors.Primarycolor,size: 20.sp,),
                      WidthSpacing(3.w),
                      Text(meal.rate , style: AppTextStyle.black12regular,)
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.watch_later , color: AppColors.Primarycolor,size: 20.sp,),
                      WidthSpacing(3.w),
                      Text(meal.time , style: AppTextStyle.black12regular,)
                    ],
                  ),
                ],
              ),
            ),
          ),
          HeightSpacing(27.h),
          Padding(
            padding: const EdgeInsets.all( 24),
            child: Divider(
              thickness: 1,
            ),
          ),
          HeightSpacing(24.h),
          Padding(padding: EdgeInsets.only(left: 16.sp),
            child: Text("Description" , style: AppTextStyle.black24regular.copyWith(fontWeight: FontWeight.bold ),),
          ),
          HeightSpacing(8.h),
          Padding(padding: EdgeInsets.only(left: 16.sp),
            child: Text(meal.discription , style: AppTextStyle.grey14regular,),
          ),
        ],
      ),
    );
  }
}
