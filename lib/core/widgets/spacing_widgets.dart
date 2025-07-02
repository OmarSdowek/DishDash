import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacing extends StatelessWidget {
  double width;
  WidthSpacing(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

class HeightSpacing extends StatelessWidget {
  double height;
  HeightSpacing(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
