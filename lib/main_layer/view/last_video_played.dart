import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

class LastVideoPlayed extends StatelessWidget {
  const LastVideoPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.mainColor.withValues(alpha: .5)),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تعلمت اليوم',
                style: CustomTextStyle.styleW400S12Black,
              ), //TODO:localization
              Text(
                'كورس البرمجه',
                style: CustomTextStyle.styleW400S10Black
                    .copyWith(color: AppColors.mainColor),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                '22 دقيقه',
                style: CustomTextStyle.styleW700S14Black,
              ),
              Text(
                ' / 59دقيقه',
                style: CustomTextStyle.styleW400S10Black,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: LinearProgressIndicator(
              value: 22 / 59,
            ),
          )
        ],
      ),
    );
  }
}
