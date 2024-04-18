import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/order/presentation/manager/order_cubit.dart';
import '../../../../core/utils/app_constants.dart';
import '../../domain/entities/order_item.dart';
import '../manager/order_state.dart';
import '../widgets/track_order.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBarWithBag(
            appBarTitle: 'My Orders'.tr(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TrackOrder(
              order: OrderItem(
                placed: true,
                shipped: false,
                pickedUp: false,
                delivered: false,
                orderNumber: ORDER_ID,
                price: CartCubit.get(context).totalCartPrice,
                state: 'Shipping',
                date: DateTime.now(),
                discount: 32,
                delivery: 32,
                items: CartCubit.get(context).products,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
