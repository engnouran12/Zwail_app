import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';

class LoginOrSignupPage extends StatelessWidget {
  const LoginOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   tileMode: TileMode.mirror,
            //   stops: [0, 5],
            //   begin: Alignment.topLeft,
            //   colors: [AppColors.mainColor.withValues(alpha: .5), Colors.white],
            // ),
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [AppColors.mainColor.withValues(alpha: .8), Colors.white],
        )),
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 200.h,
            ),
            Column(
              spacing: 14.h,
              children: [
                CustomMainButton(
                  borderRadius: 16,
                  text: context.localization.logIn,
                  height: 55.h,
                  textPadding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
                  onPressed: () => context.pushNamed(Routes.loginPage),
                ),
                CustomMainButton(
                  isOutlined: true,
                  height: 55.h,
                  borderRadius: 16,
                  onPressed: () => context.pushNamed(Routes.signupPage),
                  text: context.localization.signup,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
