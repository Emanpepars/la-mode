import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';

import '../../../../config/routes.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../register/presentation/widgets/cu_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const CuTextFormField(
                  hintText: 'Enter your Email',
                  prefixIcon: Icon(
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
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.right,
                      "Forget password",
                      style: roboto14(
                        color: AppColors.lightColor,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  text: "Sign In",
                  onPressed: () {},
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
                    Container(
                      width: 50.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.silverM),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12.sp,
                            ),
                          )),
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
                          )),
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
                        border: Border.all(color: AppColors.silverM),
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
    );
  }
}
