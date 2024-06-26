import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/auth/register/data/data_sources/register_data_source.dart';
import 'package:la_mode/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:la_mode/features/auth/register/presentation/manager/register_state.dart';
import '../../../../../core/api/dio_consumer.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/text_styles.dart';
import '../widgets/cu_text_form_field.dart';
import '../widgets/social_media.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(
        RemoteDto(
          apiConsumer: DioConsumer(
            dio: Dio(),
          ),
        ),
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failures.message,
                  style: roboto16(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Success'.tr(),
                  style: roboto16(
                    color: Colors.white,
                  ),
                ),
              ),
            );
            Navigator.pushNamed(
              context,
              Routes.home,
              arguments: state.registerEntity.user,
            );
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              'Sign Up'.tr(),
              style: roboto20(
                weight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 5.h,
            ),
            child: Form(
              autovalidateMode: RegisterCubit.get(context).autoValidateMode,
              key: RegisterCubit.get(context).registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Username'.tr(),
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          validator: (value) =>
                              RegisterCubit.get(context).validateName(value),
                          controller:
                              RegisterCubit.get(context).usernameController,
                          hintText: 'Enter your username'.tr(),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.silverDark,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Email'.tr(),
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          validator: (value) =>
                              RegisterCubit.get(context).validateEmail(value),
                          controller:
                              RegisterCubit.get(context).emailController,
                          hintText: 'Enter your Email'.tr(),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.silverDark,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Password'.tr(),
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          obscure: RegisterCubit.get(context).isPasswordSecure,
                          validator: (value) => RegisterCubit.get(context)
                              .validatePassword(value),
                          controller:
                              RegisterCubit.get(context).passwordController,
                          hintText: 'Enter your password'.tr(),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.silverDark,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context).onPasswordEyeTap();
                            },
                            icon: RegisterCubit.get(context).isPasswordSecure
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: AppColors.silverDark,
                                  )
                                : Image.asset(
                                    AppIcons.secureEye,
                                    width: 20.w,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Password should contain 9 characters with at least 1 upper case letter.",
                          style: roboto14(
                            color: AppColors.lightColor,
                            weight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Confirm password'.tr(),
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          obscure:
                              RegisterCubit.get(context).isConPasswordSecure,
                          validator: (value) => RegisterCubit.get(context)
                              .validatePassword(value),
                          controller: RegisterCubit.get(context)
                              .confirmPasswordController,
                          hintText: 'Enter your password'.tr(),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.silverDark,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context)
                                  .onConfirmPasswordEyeTap();
                            },
                            icon: RegisterCubit.get(context).isConPasswordSecure
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: AppColors.silverDark,
                                  )
                                : Image.asset(
                                    AppIcons.secureEye,
                                    width: 20.w,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        MyButton(
                          text: "Sign Up".tr(),
                          onPressed: () {
                            RegisterCubit.get(context).signUpOnPressed(
                              context,
                              Text(
                                'Processing Data'.tr(),
                                style: roboto16(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.silverM,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25.w,
                              ),
                              child: Text(
                                "Or".tr(),
                                style: roboto16(),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors.silverM,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SocialMedia(
                              assetsName: AppIcons.google,
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            const SocialMedia(
                              assetsName: AppIcons.facebook,
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            const SocialMedia(
                              assetsName: AppIcons.twitter,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have account? '.tr()),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.login,
                              );
                            },
                            child: Text(
                              'Sign in'.tr(),
                              style: roboto14(
                                color: AppColors.lightColor,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
