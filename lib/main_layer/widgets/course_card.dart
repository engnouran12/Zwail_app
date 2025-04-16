import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/circle_network_image.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/text_styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.width,
    required this.height,
  });
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomImageWidget(
              imagePath:
                  'https://s3-alpha-sig.figma.com/img/2ab5/4da2/68e85c2d8c5c6ba6ab2abf0ab1b5132a?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dJiJiBYOeeal-IryrWM75m9soHZgOfG0JJE7RCal0N~pDyoJHqjeI1DZQIY7J5TjH7yBP49DQwBHm4HiJ3Fyi4-LPVDOqXr9vDnxZDU5P5caWa864yCB2zgWdjUrG5cZ7nez6-0H4TTzcVuaeRE3KtyIkn4T9OQZrOO2F3IrTMKAnJc~r90xpkhoWFje1ov4kwPQhRBR4Z8q4teIkaG2O8IEuFhyTL-WYNeyx2aSxhOBsobYZQNqMe11TfWRcqUzI7WLO4cKq2uTtH-aGVO5yrSj~9bWl9e4RAL8QVdp7Yef3iOgadDsYohkB2dCNxL3sLtyNb-0RHayym9yNebtcw__',
              fit: BoxFit.cover,
              height: 148.h,
              width: width,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: .5),
                    ])),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.h,
                children: [
                  Row(
                    children: [
                      CustomCircleImageWidget(imagePath: '', radios: 10.r),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'مصطفي الحسيني',
                        style: CustomTextStyle.styleW400S10White,
                      ),
                      Spacer(),
                      Text(
                        '01:42:56',
                        style: CustomTextStyle.styleW400S10White,
                      )
                    ],
                  ),
                  Text(
                    'اتعلم فيجما في 324 دقيقه  م غير ..',
                    style: CustomTextStyle.styleW700S14White,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
