import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';

class PasswordChangeSuccessPage extends StatelessWidget {
  const PasswordChangeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.passwordChanged,
              height: 190.r,
              width: 190.r,
            ),
            Text(
              context.localization.passwordChanged,
              style: CustomTextStyle.styleW700S24White
                  .copyWith(fontSize: 30.sp, color: AppColors.mainColor),
            ),
            Text(
              context.localization.goToLoginPage,
              style: CustomTextStyle.styleW400S16Black
                  .copyWith(color: AppColors.mainColor),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: CustomMainButton(
                text: context.localization.backToLogin,
                onPressed: () {
                  context.go(Routes.loginOrSignupPage + Routes.loginPage);
                }, //TODO:logic
              ),
            ),
          ],
        ),
      ),
    );
  }
}
