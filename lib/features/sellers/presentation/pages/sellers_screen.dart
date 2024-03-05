import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';
import 'package:my_ecommerce_app/features/sellers/presentation/manager/sellers_cubit.dart';
import 'package:my_ecommerce_app/features/sellers/presentation/manager/sellers_state.dart';
import 'package:my_ecommerce_app/features/sellers/presentation/widgets/seller_card.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/widgets/sort_alert_dialog.dart';

class SellersScreen extends StatelessWidget {
  const SellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellersCubit(),
      child: BlocConsumer<SellersCubit, SellersState>(
        listener: (context, index) {},
        builder: (context, index) => Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBarWithBag(
            appBarTitle: "Sellers",
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "120 sellers found",
                        style: roboto14(
                          color: AppColors.silverDark,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Sort by",
                            style: roboto12W400(color: AppColors.silverDark),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SortAlertDialog();
                                  },
                                );
                              },
                              icon: const Icon(Icons.keyboard_arrow_down))
                        ],
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 6.6.h / 10.h,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w),
                    itemBuilder: (context, index) => SellerCard(
                      userName:
                          SellersCubit.get(context).sellers[index].userName,
                      rate: SellersCubit.get(context).sellers[index].rate,
                      location:
                          SellersCubit.get(context).sellers[index].location,
                      isOpen: SellersCubit.get(context).sellers[index].isOpen,
                    ),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
