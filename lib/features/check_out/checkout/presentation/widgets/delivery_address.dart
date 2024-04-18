import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../manager/check_out_cubit.dart';
import '../manager/check_out_state.dart';
import 'address_radio.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {},
      builder: (context, state) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                25.sp,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Delivery Address".tr(),
                style: roboto18W500(),
              ),
              Column(
                children: [
                  AddressRow(
                    title: 'Home',
                    value: 'Home',
                    groupValue:
                        CheckOutCubit.get(context).selectedAddressOption,
                    address: (String? newValue) =>
                        CheckOutCubit.get(context).address(newValue: newValue),
                  ),
                  Text(
                    "7 Israa street. Agouza, Giza, Egypt",
                    style: roboto14(
                        weight: FontWeight.w500, color: AppColors.silverDark),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressRow(
                    title: 'Work',
                    value: 'Work',
                    groupValue:
                        CheckOutCubit.get(context).selectedAddressOption,
                    address: (String? newValue) =>
                        CheckOutCubit.get(context).address(newValue: newValue),
                  ),
                  Text(
                    "Madinet nasr. Cairo, Egypt",
                    style: roboto14(
                        weight: FontWeight.w500, color: AppColors.silverDark),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.address,
                    );
                  },
                  child: Text(
                    "Add new address".tr(),
                    textAlign: TextAlign.end,
                    style: roboto14()
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
