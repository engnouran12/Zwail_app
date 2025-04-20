import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/config/routes.dart';

import 'package:zewail/features/course/presentation/categories/cubit/categories_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/cubit/courses_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/views/courses_horizontal_list_view.dart';
import 'package:zewail/main_layer/view/categories_list.dart';
import 'package:zewail/main_layer/view/home_header.dart';
import 'package:zewail/main_layer/view/last_video_played.dart';

class MainLayerPage extends StatefulWidget {
  const MainLayerPage({super.key});

  @override
  State<MainLayerPage> createState() => _MainLayerPageState();
}

class _MainLayerPageState extends State<MainLayerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CoursesCubit>().getAllCourses();
    context.read<CoursesCubit>().getCommonCourses();
    context.read<CategoriesCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: HomeHeader()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24.h,
            children: [
              LastVideoPlayed(),
              CategoriesList(),







              // BlocBuilder<CoursesCubit, CoursesState>(
              //   builder: (context, state) {
              //     if (state is ContentLoading) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else {
              //       return Column(
              //         spacing: 24.h,
              //         children: [
              //           CoursesHorizontalList(
              //             title: 'اشهر الدورات',
              //             courses: context.watch<CoursesCubit>().commonCourses,
              //             onPressed: () => context
              //                 .pushNamed(Routes.coursesListPage, extra: true),
              //           ),
              //           CoursesHorizontalList(
              //             title: 'كل الدورات',
              //             courses: context.watch<CoursesCubit>().courses,
              //           ),
              //           // AllCoursesList()
              //         ],
              //       );
              //     }
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
