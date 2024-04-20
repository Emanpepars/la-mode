import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/auth/login/presentation/pages/login_screen.dart';
import 'package:la_mode/features/edit_profile/presentation/pages/edit_profile_screen.dart';
import 'package:la_mode/features/home/presentation/widgets/profile_row.dart';
import 'package:la_mode/features/order/presentation/pages/my_orders.dart';
import 'package:la_mode/features/promo_code/presentation/pages/promo_code_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../auth/register/domain/entities/user_entity.dart';
import '../../../../check_out/checkout/presentation/manager/check_out_cubit.dart';
import '../../../../check_out/checkout/presentation/manager/check_out_state.dart';
import '../../../../check_out/checkout/presentation/widgets/delivery_address.dart';
import '../../../../check_out/checkout/presentation/widgets/payment_methods_card.dart';
import '../../manager/provider/home_cubit.dart';

class ProfileTab extends StatelessWidget {
  final UserEntity userEntity;

  const ProfileTab({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstAppBar(
        title: 'Profile'.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.sp,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.fakeSeller,
                      ),
                    ),
                    border: Border.all(
                      color: AppColors.gold,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        60.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userEntity.name,
                    style: roboto16().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: EditProfileScreen(
                          userEntity: userEntity,
                        ),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.lightColor,
                    ),
                  ),
                ],
              ),
              Text(
                userEntity.email,
                style: roboto16(
                  color: AppColors.silverDark,
                ).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ProfileRow(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const MyOrders(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                title: 'My orders'.tr(),
                count: 10,
                rowIcon: const Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                title: 'Inbox'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const PromoCodeScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                title: 'Promocode / Vouchers'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        BlocConsumer<CheckOutCubit, CheckOutState>(
                      listener: (context, state) {},
                      builder: (context, state) => AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Payment method".tr(),
                                style: roboto16W500(),
                              ),
                              SizedBox(height: 2.h),
                              PaymentMethod(
                                title: 'Visa',
                                value: 'Visa',
                                groupValue: CheckOutCubit.get(context)
                                    .selectedPaymentOption,
                                paymentMethods: (String? newValue) =>
                                    CheckOutCubit.get(context)
                                        .paymentMethods(newValue: newValue),
                              ),
                              PaymentMethod(
                                title: 'Cash on delivery',
                                value: 'Cash on delivery',
                                groupValue: CheckOutCubit.get(context)
                                    .selectedPaymentOption,
                                paymentMethods: (String? newValue) =>
                                    CheckOutCubit.get(context)
                                        .paymentMethods(newValue: newValue),
                              ),
                              PaymentMethod(
                                title: 'Fawry',
                                value: 'Fawry',
                                groupValue: CheckOutCubit.get(context)
                                    .selectedPaymentOption,
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
                                    "Add new card".tr(),
                                    textAlign: TextAlign.end,
                                    style: roboto14().copyWith(
                                        decoration: TextDecoration.underline),
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
                title: 'Payment methods'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.payment,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DeliveryAddress());
                },
                title: 'Delivery address'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                title: 'Following sellers'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.people_alt_outlined,
                  color: AppColors.lightColor,
                ),
              ),
              ProfileRow(
                title: 'Recently viewed'.tr(),
                count: 0,
                rowIcon: const Icon(
                  Icons.access_time_rounded,
                  color: AppColors.lightColor,
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                splashColor: Colors.white,
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                    (_) => false,
                  );
                  HomeCubit.get(context).userBox.deleteAt(0);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: AppColors.lightColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Logout'.tr(),
                      style: roboto16().copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        userName: userEntity.name,
        userEmail: userEntity.email,
      ),
    );
  }
}
