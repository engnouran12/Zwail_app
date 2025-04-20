import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomShadowButton(
          color: Colors.white,
          onTap: () => context.pop(),
          siz: 40.r,
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
        child: Column(
          children: [
            Text(
              context.localization.enterNewPassword,
              style: CustomTextStyle.styleW700S24White
                  .copyWith(fontSize: 30.sp, color: AppColors.mainColor),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomTextFormField(
              label: context.localization.password,
              hintText: context.localization.password,
            ),
            CustomTextFormField(
              label: context.localization.password,
              hintText: context.localization.password,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: CustomMainButton(
                text: context.localization.confirm,
                onPressed: () {
                  context.go(Routes.loginOrSignupPage +
                      Routes.passwordChangeSuccessPage);
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localization.rememberedPassword,
                  style: CustomTextStyle.styleW500S14Black,
                ),
                InkWell(
                    onTap: () =>
                        context.go(Routes.loginOrSignupPage + Routes.loginPage),
                    child: Text(
                      context.localization.logIn,
                      style: CustomTextStyle.styleW500S14Black
                          .copyWith(color: AppColors.mainColor),
                    )),
              ],
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      )),
    );
  }
}
