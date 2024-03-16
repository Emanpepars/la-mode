import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/register/data/data_sources/register_data_source.dart';
import 'package:la_mode/features/register/presentation/manager/register_cubit.dart';
import 'package:la_mode/features/register/presentation/manager/register_state.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/cu_text_form_field.dart';

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
                  'Success',
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
              'Sign Up',
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
              key: RegisterCubit.get(context).registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Username',
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
                          hintText: 'Enter your username',
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.silverDark,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Email',
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
                          hintText: 'Enter your email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.silverDark,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Password',
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          validator: (value) => RegisterCubit.get(context)
                              .validatePassword(value),
                          controller:
                              RegisterCubit.get(context).passwordController,
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.silverDark,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColors.silverDark,
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
                          'Confirm password',
                          style: robotoTitleField(),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CuTextFormField(
                          validator: (value) => RegisterCubit.get(context)
                              .validatePassword(value),
                          controller: RegisterCubit.get(context)
                              .confirmPasswordController,
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.silverDark,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColors.silverDark,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyButton(
                          text: "Sign Up",
                          onPressed: () {
                            RegisterCubit.get(context).signUpOnPressed(
                              context,
                              Text(
                                'Processing Data',
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
                                "Or",
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
                            Container(
                              width: 50.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.silverM,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    12.sp,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 3.h,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.google,
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.silverM,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    12.sp,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 5.h,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.facebook,
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.silverM,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    12.sp,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 3.h,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.twitter,
                              ),
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
                          const Text('Already have account? '),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.login,
                              );
                            },
                            child: Text(
                              'Sign in',
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
