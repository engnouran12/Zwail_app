import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zewail/features/course/presentation/courses_list/cubit/courses_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/views/courses_list_view.dart';
import 'package:zewail/features/course/presentation/widgets/show_filters_button.dart';

class CoursesListPAge extends StatelessWidget {
  const CoursesListPAge({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = context.watch<CoursesCubit>().courses;

    return Scaffold(
        appBar: AppBar(
          title: Text('all courses'),
        ),
        floatingActionButton: ShowFiltersButton(
          //    siz: 45.r,
          onApplyClicked: (p0) {},
        ),
        body: courses.isEmpty
            ? SizedBox()
            : CoursesListView(
                courses: courses,
              ));
  }
}
