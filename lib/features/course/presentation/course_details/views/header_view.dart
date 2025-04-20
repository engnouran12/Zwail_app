import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/responsive_size_extension.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';

class HeaderVew extends StatefulWidget {
  const HeaderVew({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  State<HeaderVew> createState() => _HeaderVewState();
}

class _HeaderVewState extends State<HeaderVew> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.courseModel.image != null &&
        widget.courseModel.image!.isNotEmpty) {
      _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.courseModel.image!)) //TODO:fix
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            (widget.courseModel.image != null &&
                        widget.courseModel.image!.isNotEmpty) &&
                    _controller.value.isInitialized
                ? SizedBox(
                    height: context.height * .3,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    height: context.height * .3,
                  ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                Colors.white.withValues(alpha: .1)),
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.mainColor,
                        )),
                    IconButton.filled(
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                AppColors.mainColor.withValues(alpha: .1)),
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline))
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الفئة التعليمية المستهدفة',
                style: CustomTextStyle.styleW400S12Black
                    .copyWith(color: AppColors.mainColor.withValues(alpha: .7)),
              ),
              Text(
                widget.courseModel.name ?? '',
                style: CustomTextStyle.styleW600S16Black,
              ),
              Row(
                spacing: 3.r,
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 12.r,
                  ),
                  Text(
                    'mints count',
                    style: CustomTextStyle.styleW500S12Black
                        .copyWith(color: AppColors.mainColor),
                  ),
                  Text(' | ', style: CustomTextStyle.styleW500S12Black),
                  Icon(
                    Icons.person_pin_outlined,
                    size: 12.r,
                  ),
                  Text(
                    'mints count',
                    style: CustomTextStyle.styleW500S12Black
                        .copyWith(color: AppColors.mainColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
