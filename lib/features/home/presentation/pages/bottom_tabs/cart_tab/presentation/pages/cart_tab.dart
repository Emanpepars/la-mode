import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/check_out/checkout/presentation/pages/check_out_screen.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_state.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/widgets/bag_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../../../core/utils/app_components.dart';
import '../../../../../../../../core/utils/app_images.dart';
import '../../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../auth/register/domain/entities/user_entity.dart';
import '../../../../../manager/provider/home_cubit.dart';

class CartTab extends StatelessWidget {
  final UserEntity userEntity;

  const CartTab({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: const ConstAppBar(
            title: 'My Bag',
          ),
          body: CartCubit.get(context).items.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Items(count: CartCubit.get(context).items.length),
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
                            'No Orders Yet',
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
                        text: 'Start Shopping',
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
                        Items(count: CartCubit.get(context).items.length),
                        SizedBox(
                          height: 15.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => BagItem(
                            productItem: CartCubit.get(context).items[index],
                          ),
                          itemCount: CartCubit.get(context).items.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
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
                              "Subtotal: ",
                              style: roboto14(weight: FontWeight.w500),
                            ),
                            Text(
                              "\$225",
                              style: roboto18W500(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        MyButton(
                          text: 'Checkout',
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: CheckoutScreen(
                                userEntity: userEntity,
                                items: CartCubit.get(context).items,
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
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
        ),
      ),
    );
  }
}
