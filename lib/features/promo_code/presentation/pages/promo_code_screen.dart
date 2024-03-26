import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../home/presentation/manager/provider/home_cubit.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBag(
        appBarTitle: "My Promocodes",
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Items(count: 0),
            Column(
              children: [
                Image.asset(
                  AppImages.promoCodes,
                  width: 200.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'No Promocodes yet',
                  style: roboto20(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 320.w,
                  child: Text(
                    'Looks like you don\'t have any promocodes or vouchers yet.',
                    style: roboto16(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            MyButton(
              text: 'Start Shopping',
              onPressed: () {
                HomeCubit.get(context).controller.index = 0;
              },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(userName: '', userEmail: '',),

    );
  }
}
