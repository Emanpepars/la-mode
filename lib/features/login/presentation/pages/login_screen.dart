import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/api/dio_consumer.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/cache_helper.dart';
import 'package:la_mode/features/login/data/data_sources/login_remote_dto.dart';
import 'package:la_mode/features/login/presentation/manager/login_cubit.dart';
import 'package:la_mode/features/login/presentation/manager/login_state.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../register/presentation/widgets/cu_text_form_field.dart';
import '../../../register/presentation/widgets/social_media.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRemoteDto(DioConsumer(dio: Dio()))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CacheHelper.saveData(
              key: 'user',
              value: state.loginEntity.token,
            );

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
              arguments: state.loginEntity.user,
            );
          } else if (state is LoginError) {
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
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              'Sign In',
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
              key: LoginCubit.get(context).loginFormKey,
              autovalidateMode: LoginCubit.get(context).autoValidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Email',
                        style: robotoTitleField(),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CuTextFormField(
                        controller: LoginCubit.get(context).emailController,
                        validator: (value) =>
                            LoginCubit.get(context).validateEmail(value),
                        hintText: 'Enter your Email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.silverDark,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Password',
                        style: robotoTitleField(),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CuTextFormField(
                        controller: LoginCubit.get(context).passwordController,
                        validator: (value) =>
                            LoginCubit.get(context).validatePassword(value),
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.forgetPassword);
                        },
                        child: Text(
                          textAlign: TextAlign.right,
                          "Forget password",
                          style: roboto14(
                            color: AppColors.lightColor,
                            weight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MyButton(
                        text: "Sign In",
                        onPressed: () {
                          LoginCubit.get(context).loginUpOnPressed(
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
                        height: 20.h,
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
                        height: 20.h,
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
                        const Text('Don\'t have an account? '),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.register,
                            );
                          },
                          child: Text(
                            'Create a new account ',
                            style: roboto14(
                              color: AppColors.lightColor,
                              weight: FontWeight.w700,
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
    );
  }
}
