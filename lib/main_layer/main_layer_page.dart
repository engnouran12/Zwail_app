import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/main_layer/view/all_courses_list.dart';
import 'package:zewail/main_layer/view/categories_list.dart';
import 'package:zewail/main_layer/view/courses_horizontal_list.dart';
import 'package:zewail/main_layer/view/home_header.dart';
import 'package:zewail/main_layer/view/last_video_played.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24.h,
            children: [
              LastVideoPlayed(),
              CategoriesList(),
              CoursesHorizontalList(
                title: 'اشهر الدورات',
              ),
              CoursesHorizontalList(
                title: 'دورات التصميم',
              ),
              AllCoursesList()
            ],
          ),
        ),
      ),
    );
  }
}
