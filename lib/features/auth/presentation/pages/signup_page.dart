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

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              context.pushNamed(Routes.mainLayer);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
            child: ListView(
              children: [
                Text(
                  context.localization.signup,
                  style: CustomTextStyle.styleW700S24White
                      .copyWith(fontSize: 30.sp, color: AppColors.mainColor),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        label: context.localization.userName,
                        hintText: context.localization.userName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return context.localization.invalidFirstName;
                          }
                          return null;
                        },
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
                        controller: _phoneController,
                        label: context.localization.phoneNumber,
                        hintText: context.localization.phoneNumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return context.localization.invalidPhoneNumber;
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
                          } else if (value.length < 8) {
                            return context.localization.invalidPassword;
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: CustomMainButton(
                          text: context.localization.signup,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signUp(UserModel(
                                  phone: _phoneController.text,
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    context.localization.orSignUpWith,
                    style: CustomTextStyle.styleW500S14Black,
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.localization.alreadyHaveAnAccount,
                      style: CustomTextStyle.styleW500S14Black,
                    ),
                    InkWell(
                        onTap: () {
                          context.pushReplacementNamed(Routes.loginPage);
                        },
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
