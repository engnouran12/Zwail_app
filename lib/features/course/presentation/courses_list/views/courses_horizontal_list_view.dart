import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/presentation/widgets/course_card.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class CoursesHorizontalList extends StatelessWidget {
  const CoursesHorizontalList(
      {super.key, required this.title, required this.courses});
  final String title;
  final List<CourseModel> courses;
  @override
  Widget build(BuildContext context) {
    return courses.isEmpty
        ? SizedBox()
        : Column(
            spacing: 16.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTitleWidget(title: title),
                  TextButton(
                      onPressed: () => //TODO:edit
                          context.pushNamed(Routes.coursesListPage),
                      child: Text('عرض الكل')) //TODO:localization
                ],
              ),
              SizedBox(
                height: 148.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) => CourseCard(
                    height: null,
                    width: 256.w,
                    courseModel: courses[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 30.w,
                  ),
                ),
              )
            ],
          );
  }
}
