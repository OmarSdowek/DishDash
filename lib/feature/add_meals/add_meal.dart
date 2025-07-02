import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/database/database_helper.dart';
import 'package:meal_app_2/core/model/data.dart';
import 'package:meal_app_2/core/style/app_text_style.dart';
import 'package:meal_app_2/core/style/color.dart';
import 'package:meal_app_2/core/widgets/custom_textfeild.dart';
import 'package:meal_app_2/core/widgets/spacing_widgets.dart';
import 'package:meal_app_2/feature/home_screen/home_screen.dart';

import '../../core/widgets/primary_button_widgets.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  TextEditingController name = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController ImageUrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Meal" , style: AppTextStyle.black16regular,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpacing(28.h),
                Text("Meal Name" , style: AppTextStyle.black16regular,),
                HeightSpacing(8.h),
                CustomTextField(
                  hintText: "Ex...Burger",
                  maxLines: 1,
                  controller: name,
                  keyboardType: TextInputType.text,
                  validator: (value) {
            if (value == null || value.isEmpty) {
            return 'name cannot be empty';
            }
            }
                ),
                HeightSpacing(8.h),
                Text("Image URL" , style: AppTextStyle.black16regular,),
                HeightSpacing(8.h),
                CustomTextField(
                  hintText: "https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg",
                  maxLines: 3,
                  controller: ImageUrl,
                  keyboardType: TextInputType.text,
                  validator: (value) {
            if (value == null || value.isEmpty) {
            return 'image cannot be empty';
            }}
                ),
                HeightSpacing(8.h),
                Text("Rate" , style: AppTextStyle.black16regular,),
                HeightSpacing(8.h),
                CustomTextField(
                  hintText: "EX 3.9",
                  maxLines: 1,
                  controller: rate,
                  keyboardType: TextInputType.number,
                  validator: (value) {
            if (value == null || value.isEmpty) {
            return 'rate cannot be empty';
            }}
                ),
                HeightSpacing(8.h),
                Text("Time" , style: AppTextStyle.black16regular,),
                HeightSpacing(8.h),
                CustomTextField(
                  hintText: "EX 20-30",
                  maxLines: 1,
                  controller: time,
                  keyboardType: TextInputType.text,
                  validator: (value) {
            if (value == null || value.isEmpty) {
            return 'time cannot be empty';
            }}
                ),
                HeightSpacing(8.h),
                Text("Description" , style: AppTextStyle.black16regular,),
                HeightSpacing(8.h),
                CustomTextField(
                  hintText: "EX first \n     second",
                  maxLines: 4,
                  controller: description,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'description cannot be empty';
                    }
                  },
                ),
                HeightSpacing(8.h),
        
                PrimayButtonWidget(
                  buttonText: "Save",
                  textColor: AppColors.Kwhite,
                  buttonColor: AppColors.Primarycolor,
                  onPress: () {
                    if(_formKey.currentState!.validate()){
                          setState(() {});
                          ModelFood model = ModelFood(
                              title: name.text,
                              ImageUrl: ImageUrl.text,
                              rate: rate.text,
                              time: time.text,
                              discription: description.text);
                         DatabaseHelper.InsertData(model).then((value) {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
                         },);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
