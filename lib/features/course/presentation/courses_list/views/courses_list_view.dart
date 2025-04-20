import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/presentation/widgets/course_card.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView(
      {super.key,
      required this.courses,
      this.shrinkWrap = false,
      this.padding});
  final List<CourseModel> courses;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? NeverScrollableScrollPhysics() : null,
      itemCount: courses.length,
      itemBuilder: (context, index) =>
          CourseCard(height: 148.h, courseModel: courses[index]),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 15.h,
      ),
    );
  }
}
