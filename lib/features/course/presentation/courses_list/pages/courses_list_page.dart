import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zewail/core/common/presentation/widgets/networkWidgets/error_widget.dart';
import 'package:zewail/features/course/presentation/courses_list/cubit/courses_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/views/courses_list_view.dart';
import 'package:zewail/features/course/presentation/widgets/show_filters_button.dart';

class CoursesListPAge extends StatefulWidget {
  const CoursesListPAge({super.key, this.mostPopular = false});
  final bool? mostPopular;

  @override
  State<CoursesListPAge> createState() => _CoursesListPAgeState();
}

class _CoursesListPAgeState extends State<CoursesListPAge> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesCubit>().resetParameters();

    context
        .read<CoursesCubit>()
        .getAllCoursesFiltered(mostPopular: widget.mostPopular);
  }

  @override
  Widget build(BuildContext context) {
    var courses = context.watch<CoursesCubit>().allCoursesFiltered;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.mostPopular == true
              ? 'most popular'
              : 'all courses'), //TODO:localization
        ),
        floatingActionButton: ShowFiltersButton(
          //    siz: 45.r,
          onApplyClicked: (p0) {},
        ),
        body: BlocBuilder<CoursesCubit, CoursesState>(
          builder: (context, state) {
            if (state is GetAllCoursesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetAllCoursesFailure) {
              return CustomErrorWidget(
                  error: state.failure,
                  refresh: () =>
                      context.read<CoursesCubit>().getAllCoursesFiltered());
            }
            return courses.isEmpty
                ? SizedBox()
                : CoursesListView(
                    courses: courses,
                  );
          },
        ));
  }
}
