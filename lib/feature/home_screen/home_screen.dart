import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app_2/core/database/database_helper.dart';
import 'package:meal_app_2/core/model/data.dart';
import 'package:meal_app_2/core/style/app_text_style.dart';
import 'package:meal_app_2/core/style/color.dart';
import 'package:meal_app_2/core/widgets/spacing_widgets.dart';
import 'package:meal_app_2/feature/add_meals/add_meal.dart';
import 'package:meal_app_2/feature/home_screen/widgets/custom_Item_widget.dart';
import 'package:meal_app_2/feature/home_screen/widgets/custom_top_head_widgets.dart';
import 'package:meal_app_2/feature/meal_details/meal_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddMeal(),
            ));
          },
          elevation: 2,
          backgroundColor: Colors.white,
          shape: CircleBorder(
              side: BorderSide(width: 1.w, color: AppColors.Primarycolor)),
          child: Container(
            width: 60.w,
            height: 60.h,
            child: const Icon(
              Icons.add,
              color: AppColors.Primarycolor,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTopHeadWidgets(),
              HeightSpacing(25.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Your Food",
                  style: AppTextStyle.black16regular,
                ),
              ),
              HeightSpacing(16.h),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FutureBuilder(
                      future: DatabaseHelper.GetData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.Primarycolor,
                            ),
                          );
                        } else if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Center(
                              child: Text(
                                "No Meals Found",
                                style: AppTextStyle.black16regular,
                              ),
                            );
                          }
                          return GridView.builder(
                            itemCount: snapshot
                                .data!.length, // ← لازم تحدد عدد العناصر
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 3 / 4, // للتحكم في شكل العنصر
                            ),
                            itemBuilder: (context, index) {
                              ModelFood meal = snapshot.data![index];
                              return CustomItemWidget(
                                title: meal.title,
                                imageurl: meal.ImageUrl,
                                rate: meal.rate.toString(),
                                time: meal.time.toString(),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MealDetails(
                                        meal:meal),
                                  ));
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        return Center(
                          child: Text("Nothing"),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
