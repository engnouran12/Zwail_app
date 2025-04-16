import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/assets.dart';

class SplashThumbnail extends StatelessWidget {
  final void Function()? onEnd;
  const SplashThumbnail({this.onEnd, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.logo,
            height: 150.h,
          ),
          SizedBox(
            height: 50.h,
          ),
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 1),
              onEnd: onEnd,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                );
              }),
        ],
      ),
    ));
  }
}
