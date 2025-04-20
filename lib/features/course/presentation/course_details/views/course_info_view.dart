import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseInfoView extends StatelessWidget {
  const CourseInfoView({super.key, required this.courseModel});

  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18.h,
        children: [
          Text(
            'تفاصيل ادق',
            style: CustomTextStyle.styleW600S18Black,
          ),
          infoRow('25 units', AppAssets.unitsIcon), //TODO:localization
          infoRow('25 students', AppAssets.participants),
          infoRow('25 quiz', AppAssets.quizIcon),
          Text(
            courseModel.description ?? 'xxxxxxxxxxxxx' * 10,
            style: CustomTextStyle.styleW500S12Black
                .copyWith(color: AppColors.mainColor.withValues(alpha: .7)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'الدوره بواسطه', //TODO:localization
            style: CustomTextStyle.styleW600S18Black,
          )
        ],
      ),
    );
  }

  infoRow(String title, String iconPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 18.w,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 20.r,
        ),
        Text(
          title,
          style: CustomTextStyle.styleW500S14Black
              .copyWith(color: AppColors.mainColor),
        ),
      ],
    );
  }
}
