import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/circle_network_image.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends PreferredSize {
  HomeHeader({super.key})
      : super(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  spacing: 8.w,
                  children: [
                    CustomCircleImageWidget(imagePath: '', radios: 18.r),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'صباح الخير ☀️',
                          style: CustomTextStyle.styleW400S10Black,
                        ),
                        Text(
                          'مصطفي الحسيني',
                          style: CustomTextStyle.styleW600S12Black,
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                            child: (SvgPicture.asset(AppAssets.searchIcon)))),
                    InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                            child: (SvgPicture.asset(
                                AppAssets.notificationsIcon))))
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight));
}
