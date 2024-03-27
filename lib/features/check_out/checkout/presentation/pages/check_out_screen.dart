import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/check_out/checkout/presentation/manager/check_out_cubit.dart';
import 'package:la_mode/features/check_out/checkout/presentation/manager/check_out_state.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../auth/register/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import '../widgets/order_card.dart';
import '../widgets/payment_methods_card.dart';

class CheckoutScreen extends StatelessWidget {
  final UserEntity userEntity;
  final List<ProductItem> items;

  const CheckoutScreen(
      {super.key, required this.userEntity, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit(),
      child: BlocConsumer<CheckOutCubit, CheckOutState>(
        listener: (context, state) {},
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

                                onTap: () {},
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
                              CheckOutCubit.get(context).selectedSortOption,
                          paymentMethods: (BuildContext context,
                                  String? newValue) =>
                              CheckOutCubit.get(context)
                                  .paymentMethods(context, newValue: newValue),
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
                              style: roboto14().copyWith(
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        PaymentMethod(
                          title: 'Cash on delivery',
                          value: 'Cash on delivery',
                          groupValue:
                              CheckOutCubit.get(context).selectedSortOption,
                          paymentMethods: (BuildContext context,
                                  String? newValue) =>
                              CheckOutCubit.get(context)
                                  .paymentMethods(context, newValue: newValue),
                        ),
                        PaymentMethod(
                          title: 'Fawry',
                          value: 'Fawry',
                          groupValue:
                              CheckOutCubit.get(context).selectedSortOption,
                          paymentMethods: (BuildContext context,
                                  String? newValue) =>
                              CheckOutCubit.get(context)
                                  .paymentMethods(context, newValue: newValue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const MyButton(text: 'Confirm Order'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
