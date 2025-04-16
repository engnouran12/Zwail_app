import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.styleW600S16Black,
        ),
        Container(
          height: 3.h,
          width: 52.w,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(5.r)),
        )
      ],
    );
  }
}
