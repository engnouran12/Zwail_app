import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/main_layer/widgets/course_card.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class CoursesHorizontalList extends StatelessWidget {
  const CoursesHorizontalList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTitleWidget(title: title),
            TextButton(onPressed: () {}, child: Text('عرض الكل'))
          ],
        ),
        SizedBox(
          height: 148.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => CourseCard(
              height: null,
              width: 256.w,
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 30.w,
            ),
          ),
        )
      ],
    );
  }
}
