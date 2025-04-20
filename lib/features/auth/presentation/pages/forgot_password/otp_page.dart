import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/features/auth/presentation/cubit/auth_cubit.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.verifyEmail = false});
  final bool verifyEmail;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController controller = TextEditingController();
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            if (state.code != '0000') {
              context.goNamed(Routes.mainLayer);
            }
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.localization.pleaseCheckYourAccount,
                  style: CustomTextStyle.styleW700S24White
                      .copyWith(fontSize: 30.sp, color: AppColors.mainColor),
                ),
                Text(
                  //TODO:get email
                  '${context.localization.otpSent} ',
                  style: CustomTextStyle.styleW400S16Black
                      .copyWith(color: AppColors.mainColor),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 6,
                        controller: controller,
                        autofocus: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        defaultPinTheme: PinTheme(
                          width: 56.w,
                          height: 56.h,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 0.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        onCompleted: (String verificationCode) {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.h),
                  child: CustomMainButton(
                    text: context.localization.sendCode,
                    onPressed: () {
                      context.pushNamed(Routes.resetPasswordPage);
                    }, //TODO:logic
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.localization.resetPassword,
                      style: CustomTextStyle.styleW400S16Black.copyWith(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(' 01:00') //TODO:timer
                  ],
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
                        onTap: () => context
                            .go(Routes.loginOrSignupPage + Routes.loginPage),
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
          ),
        ),
      ),
    );
  }
}
