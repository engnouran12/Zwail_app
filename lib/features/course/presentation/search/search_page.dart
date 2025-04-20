import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zewail/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/presentation/widgets/course_search_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormField(
          hintText: 'ابحث عن الكورس',
          suffixIcon: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(12.r)),
              child: SvgPicture.asset(
                AppAssets.searchSecIcon,
              )),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) =>
            CourseSearchCard(courseModel: CourseModel()),
      ),
    );
  }
}
