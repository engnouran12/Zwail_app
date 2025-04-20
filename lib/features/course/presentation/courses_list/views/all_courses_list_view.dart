import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/features/course/presentation/courses_list/cubit/courses_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/views/courses_list_view.dart';
import 'package:zewail/features/course/presentation/widgets/show_filters_button.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class AllCoursesList extends StatelessWidget {
  const AllCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = context.watch<CoursesCubit>().courses;
    return courses.isEmpty
        ? SizedBox()
        : Column(
            spacing: 24.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTitleWidget(title: 'كل الدورات'), //TODO:Localization
                  ShowFiltersButton(
                    //    siz: 45.r,
                    onApplyClicked: (p0) {},
                  ),
                ],
              ),
              CoursesListView(
                courses: courses,
                shrinkWrap: true,
              )
            ],
          );
  }
}
