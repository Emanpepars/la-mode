import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/order/presentation/manager/order_cubit.dart';
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
          appBar: const AppBarWithBag(
            appBarTitle: 'My Orders',
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => TrackOrder(
                order: OrderCubit.get(context).orders[index],
              ),
              itemCount: OrderCubit.get(context).orders.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
