import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/circle_network_image.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zewail/features/auth/presentation/cubit/auth_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
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
                  context.watch<AuthCubit>().currentUser?.name ?? '',
                  style: CustomTextStyle.styleW600S12Black,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                onTap: () => context.pushNamed(Routes.searchPage),
                child: CircleAvatar(
                    child: (SvgPicture.asset(AppAssets.searchIcon)))),
            InkWell(
                child: CircleAvatar(
                    child: (SvgPicture.asset(AppAssets.notificationsIcon))))
          ],
        ),
      ),
    );
  }
}
