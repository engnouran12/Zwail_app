import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_form_validations.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/features/auth/domain/entities/user_model.dart';
import 'package:zewail/features/auth/presentation/cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.goNamed(Routes.mainLayer);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    context.localization.logIn,
                    style: CustomTextStyle.styleW700S24White
                        .copyWith(fontSize: 30.sp, color: AppColors.mainColor),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    label: context.localization.email,
                    hintText: context.localization.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return context.localization.invalidEmail;
                      } else if (!TextFormValidations.isValidEmail(value)) {
                        return context.localization.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    label: context.localization.password,
                    hintText: context.localization.password,
                    password: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return context.localization.invalidPassword;
                      } else if (value.length < 6) {
                        return context.localization.invalidPassword;
                      }
                      return null;
                    },
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.forgotPasswordPage),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        context.localization.forgotPassword,
                        style: CustomTextStyle.styleW500S14Black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: CustomMainButton(
                      text: context.localization.logIn,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(UserModel(
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                        //
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      context.localization.orLoginWith,
                      style: CustomTextStyle.styleW500S14Black,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localization.dontHaveAnAccount,
                        style: CustomTextStyle.styleW500S14Black,
                      ),
                      InkWell(
                          onTap: () =>
                              context.pushReplacementNamed(Routes.signupPage),
                          child: Text(
                            context.localization.signup,
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
      ),
    );
  }
}
