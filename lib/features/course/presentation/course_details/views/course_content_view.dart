import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';

class CourseContentView extends StatelessWidget {
  const CourseContentView({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Row(
            children: [
              Text('data'),
            ],
          ),
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: SvgPicture.asset(
                        AppAssets.bookIcon,
                        width: 20.r,
                      ),
                    ),
                    title: Text('xxxxx'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
