import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:la_mode/features/login/presentation/manager/forget_password_cubit.dart';
import 'package:la_mode/features/login/presentation/manager/forget_password_states.dart';

import '../../../../../config/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../register/presentation/widgets/cu_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Forget Password',
              style: roboto20(
                weight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Image.asset(
                  AppImages.forgetPassword,
                  height: 150.h,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Please enter ',
                            style: roboto16W400(),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ForgetPasswordCubit.get(context).isPhone
                                ? 'your Phone number to '
                                : 'your Email Address to ',
                            style: roboto16W400(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Text(
                        'receive an ОТР code',
                        style: roboto16W400(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    ForgetPasswordCubit.get(context).isPhone
                        ? 'Phone number'
                        : 'Email',
                    style: robotoTitleField(),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CuTextFormField(
                  controller: ForgetPasswordCubit.get(context).emailController,
                  validator: (value) =>
                      ForgetPasswordCubit.get(context).validateEmail(value),
                  hintText: ForgetPasswordCubit.get(context).isPhone
                      ? 'Enter your phone number'
                      : 'Enter your email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.silverDark,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  text: "Send Code",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.otpCode,
                      arguments: ForgetPasswordCubit.get(context).isPhone,
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Or recover password by using '),
                    InkWell(
                      onTap: () {
                        ForgetPasswordCubit.get(context).onTabInk();
                      },
                      child: Text(
                        ForgetPasswordCubit.get(context).isPhone
                            ? 'Email'
                            : 'Phone number',
                        style: roboto14(
                          color: AppColors.lightColor,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
