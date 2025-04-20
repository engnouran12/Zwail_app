import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseSearchCard extends StatelessWidget {
  const CourseSearchCard({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () =>
      //     context.pushNamed(Routes.courseDetailsPage, extra: courseModel.id),
      child: Card(
        child: Row(
          spacing: 10.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(12)),
              child: CustomImageWidget(
                imagePath: courseModel.image ?? '',
                width: 130.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'courseModel.', //TODO:
                  style: CustomTextStyle.styleW700S14White.copyWith(
                      color: AppColors.mainColor.withValues(alpha: .3)),
                ),
                Text(
                  courseModel.name ?? '',
                  style: CustomTextStyle.styleW600S16Black,
                ),
                Text(
                  '${courseModel.weeks != 0 ? '${courseModel.weeks}w' : ''}'
                  '${courseModel.weeks != 0 ? ', ' : ''}'
                  '${courseModel.hours != 0 ? '${courseModel.hours}h' : ''}'
                  '${courseModel.hours != 0 ? ', ' : ''}'
                  '${courseModel.minutes != 0 ? '${courseModel.minutes}m' : ''}',
                  style: CustomTextStyle.styleW600S16Black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
