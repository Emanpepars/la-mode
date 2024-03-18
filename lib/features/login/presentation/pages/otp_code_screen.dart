import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../register/presentation/widgets/cu_text_form_field.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    'Please the 4 digit code that was',
                    style: roboto16W400(),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'sent to ',
                        style: roboto16W400(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'yourmail@example.com',
                        style: roboto16W500(),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                'Email',
                style: robotoTitleField(),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const CuTextFormField(
              // controller: LoginCubit.get(context).emailController,
              //  validator: (value) =>
              //      LoginCubit.get(context).validateEmail(value),
              hintText: 'Enter your Email',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.silverDark,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const MyButton(text: "Send Code"),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Or recover password by using '),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Phone number',
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
    );
  }
}
