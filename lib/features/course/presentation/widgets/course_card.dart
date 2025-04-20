import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/circle_network_image.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key, this.width, this.height, required this.courseModel});
  final double? width, height;
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    print('XXXX${courseModel.instructors}');
    return InkWell(
      onTap: () =>
          context.pushNamed(Routes.courseDetailsPage, extra: courseModel.id),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomImageWidget(
                imagePath: courseModel.image ?? '',
                fit: BoxFit.cover,
                height: 148.h,
                width: width,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: .5),
                      ])),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5.h,
                  children: [
                    Row(
                      children: [
                        CustomCircleImageWidget(
                          imagePath: '',
                          radios: 10.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          (courseModel.instructors ?? []).isNotEmpty
                              ? courseModel.instructors!.first
                              : '',
                          style: CustomTextStyle.styleW400S10White,
                        ),
                        Spacer(),
                        Text(
                          '${courseModel.weeks != 0 ? '${courseModel.weeks}w' : ''}'
                          '${courseModel.weeks != 0 ? ', ' : ''}'
                          '${courseModel.hours != 0 ? '${courseModel.hours}h' : ''}'
                          '${courseModel.hours != 0 ? ', ' : ''}'
                          '${courseModel.minutes != 0 ? '${courseModel.minutes}m' : ''}',
                          style: CustomTextStyle.styleW400S10White,
                        )
                      ],
                    ),
                    Text(
                      courseModel.name ?? '',
                      style: CustomTextStyle.styleW700S14White,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
