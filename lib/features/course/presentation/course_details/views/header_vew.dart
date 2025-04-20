import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:zewail/core/config/colors.dart';
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
    return Stack(
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
                        backgroundColor: Colors.white.withValues(alpha: .1)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
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
    );
  }
}
