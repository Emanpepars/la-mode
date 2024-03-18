import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/app_images.dart';

import '../../../../../config/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../register/presentation/widgets/cu_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
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
              AppImages.resetPassword,
              height: 150.h,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'New password',
                style: robotoTitleField(),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            CuTextFormField(
              // validator: (value) => RegisterCubit.get(context)
              //     .validatePassword(value),
              // controller:
              // RegisterCubit.get(context).passwordController,
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
            SizedBox(
              width: double.infinity,
              child: Text(
                'Confirm new password',
                style: robotoTitleField(),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            CuTextFormField(
              // validator: (value) => RegisterCubit.get(context)
              //     .validatePassword(value),
              // controller: RegisterCubit.get(context)
              //     .confirmPasswordController,
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
              height: 30.h,
            ),
            MyButton(
              text: "Confirm New Password",
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
