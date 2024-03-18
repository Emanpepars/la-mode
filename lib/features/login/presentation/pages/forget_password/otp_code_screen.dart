import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Code',
          style: roboto20(
            weight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.otpCode,
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
                  width: 250.w,
                  child: PinCodeTextField(
                    cursorHeight: 2.h,
                    cursorWidth: 15.w,
                    keyboardType: TextInputType.number,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.sp),
                      fieldHeight: 45.h,
                      fieldWidth: 50.w,
                      activeFillColor: Colors.white,
                      activeColor: AppColors.silverM,
                      selectedColor: AppColors.silverM,
                      inactiveColor: AppColors.silverM,
                      disabledColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      errorBorderColor: Colors.red,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                    text: "Confirm Code",
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.resetPassword);
                    }),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("0:28"),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' Resend ',
                        style: roboto14(
                          color: AppColors.lightColor,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Text('confirmation code'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wrong email?'),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    ' Change email.',
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
