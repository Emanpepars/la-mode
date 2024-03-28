import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/check_out/checkout/presentation/manager/check_out_cubit.dart';
import 'package:la_mode/features/check_out/checkout/presentation/manager/check_out_state.dart';
import 'package:la_mode/features/check_out/checkout/presentation/widgets/address_radio.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../auth/register/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/product_item.dart';
import '../widgets/order_card.dart';
import '../widgets/payment_alert_dialog.dart';
import '../widgets/payment_methods_card.dart';

class CheckoutScreen extends StatelessWidget {
  final UserEntity userEntity;
  final List<ProductItem> items;

  const CheckoutScreen(
      {super.key, required this.userEntity, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        if (state is VisaState) {
          Navigator.pushNamed(context, Routes.visa);
        } else if (state is FawryState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "your code is: $REF_CODE",
                    style: roboto16W500(),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  MyButton(
                    text: 'Done',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyButton(
                    color: Colors.white,
                    textColor: AppColors.lightColor,
                    text: 'Change Method',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is CashState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.done,
                      height: 100.h,
                      width: 80.w,
                    ),
                    Text(
                      "Order Placed!",
                      style: roboto16W500(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Your order #$ORDER_ID was placed successfully. You can see the status of your order at any time.",
                      style: roboto14(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyButton(
                      text: 'Track Your Order',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyButton(
                      color: Colors.white,
                      textColor: AppColors.lightColor,
                      text: 'Back To Home',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.home,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: const AppBarWithBag(
          appBarTitle: 'Checkout',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.w,
              vertical: 10.h,
            ),
            child: Column(
              children: [
                OrderCard(items: items),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGray,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.sp,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Delivery address",
                                style: roboto16W500(),
                              ),
                            ],
                          ),
                          InkWell(
                              splashColor: Colors.white,
                              highlightColor: Colors.white,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => BlocConsumer<
                                      CheckOutCubit, CheckOutState>(
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 20.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Delivery Address",
                                              style: roboto18W500(),
                                            ),
                                            Column(
                                              children: [
                                                AddressRow(
                                                  title: 'Home',
                                                  value: 'Home',
                                                  groupValue: CheckOutCubit.get(
                                                          context)
                                                      .selectedAddressOption,
                                                  address: (String? newValue) =>
                                                      CheckOutCubit.get(context)
                                                          .address(
                                                              newValue:
                                                                  newValue),
                                                ),
                                                Text(
                                                  "7 Israa street. Agouza, Giza, Egypt",
                                                  style: roboto14(
                                                      weight: FontWeight.w500,
                                                      color:
                                                          AppColors.silverDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AddressRow(
                                                  title: 'Work',
                                                  value: 'Work',
                                                  groupValue: CheckOutCubit.get(
                                                          context)
                                                      .selectedAddressOption,
                                                  address: (String? newValue) =>
                                                      CheckOutCubit.get(context)
                                                          .address(
                                                              newValue:
                                                                  newValue),
                                                ),
                                                Text(
                                                  "Madinet nasr. Cairo, Egypt",
                                                  style: roboto14(
                                                      weight: FontWeight.w500,
                                                      color:
                                                          AppColors.silverDark),
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
                                                  "Add new address",
                                                  textAlign: TextAlign.end,
                                                  style: roboto14().copyWith(
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.arrow_forward))
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "7 Israa street. Agouza, Giza, Egypt",
                        style: roboto14(
                            weight: FontWeight.w500,
                            color: AppColors.silverDark),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGray,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.sp,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.payment,
                            color: AppColors.lightColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Payment method",
                            style: roboto16W500(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      PaymentMethod(
                        title: 'Visa',
                        value: 'Visa',
                        groupValue:
                            CheckOutCubit.get(context).selectedPaymentOption,
                        paymentMethods: (String? newValue) =>
                            CheckOutCubit.get(context)
                                .paymentMethods(newValue: newValue),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          splashColor: Colors.white,
                          highlightColor: Colors.white,
                          onTap: () {},
                          child: Text(
                            "Add new card",
                            textAlign: TextAlign.end,
                            style: roboto14()
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      PaymentMethod(
                        title: 'Cash on delivery',
                        value: 'Cash on delivery',
                        groupValue:
                            CheckOutCubit.get(context).selectedPaymentOption,
                        paymentMethods: (String? newValue) =>
                            CheckOutCubit.get(context)
                                .paymentMethods(newValue: newValue),
                      ),
                      PaymentMethod(
                        title: 'Fawry',
                        value: 'Fawry',
                        groupValue:
                            CheckOutCubit.get(context).selectedPaymentOption,
                        paymentMethods: (String? newValue) =>
                            CheckOutCubit.get(context)
                                .paymentMethods(newValue: newValue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MyButton(
                  text: 'Confirm Order',
                  onPressed: () {
                    if (CheckOutCubit.get(context).selectedPaymentOption ==
                        "Cash on delivery") {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const PaymentAlertDialog(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
