import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_state.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/payment/payment_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/widgets/bag_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../../../core/utils/app_components.dart';
import '../../../../../../../../core/utils/app_images.dart';
import '../../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../auth/register/domain/entities/user_entity.dart';
import '../../../../../../../check_out/checkout/presentation/pages/check_out_screen.dart';
import '../../../../../manager/provider/home_cubit.dart';
import '../manager/payment/payment_state.dart';

class CartTab extends StatelessWidget {
  final UserEntity userEntity;

  const CartTab({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentCubit(),
        )
      ],
      child:
          BlocConsumer<PaymentCubit, PaymentStates>(listener: (context, state) {
        if (state is SuccessReferenceCodePaymentState) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: CheckoutScreen(
              cartProducts: CartCubit.get(context).products,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      }, builder: (context, state) {
        return BlocConsumer<CartCubit, CartState>(listener: (context, state) {
          if (state is SuccessReferenceCodePaymentState) {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: CheckoutScreen(
                cartProducts: CartCubit.get(context).products,
              ),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: ConstAppBar(
              title: 'My Bag'.tr(),
            ),
            body: CartCubit.get(context).products.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                        left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Items(
                          count: CartCubit.get(context).products.length,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AppImages.order,
                              width: 200.w,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'No Orders Yet'.tr(),
                              style: roboto20(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                'Looks like you haven\'t any placed any order yet. Go and enjoy shopping.',
                                style: roboto16(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        MyButton(
                          text: 'Start Shopping'.tr(),
                          onPressed: () {
                            HomeCubit.get(context).controller.index = 0;
                          },
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
                      child: Column(
                        children: [
                          Items(count: CartCubit.get(context).products.length),
                          SizedBox(
                            height: 15.h,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => BagItem(
                              productItem:
                                  CartCubit.get(context).products[index],
                            ),
                            itemCount: CartCubit.get(context).products.length,
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 10.h,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Subtotal: ".tr(),
                                style: roboto14(weight: FontWeight.w500),
                              ),
                              Text(
                                "\$${CartCubit.get(context).totalCartPrice}",
                                style: roboto18W500(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          MyButton(
                            text: 'Checkout'.tr(),
                            onPressed: () {
                              PaymentCubit.get(context).getAuthToken(
                                "eman@gmail.com",
                                "01120744802",
                                "eman",
                                "ashraf",
                                "${CartCubit.get(context).totalCartPrice}",
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
            drawer: MyDrawer(
              userName: userEntity.name,
              userEmail: userEntity.email,
            ),
          );
        });
      }),
    );
  }
}
