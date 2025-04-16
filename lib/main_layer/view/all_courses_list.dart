import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/main_layer/widgets/course_card.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class AllCoursesList extends StatelessWidget {
  const AllCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTitleWidget(title: 'كل الدورات'),
            CustomShadowButton(
                color: AppColors.mainColor.withValues(alpha: .1),
                onTap: () {},
                padding: EdgeInsets.all(8.r),
                icon: SvgPicture.asset(
                  AppAssets.filtersIcon,
                )),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => CourseCard(
            height: 148.h,
            width: double.infinity,
          ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 20.h,
          ),
        )
      ],
    );
  }
}
