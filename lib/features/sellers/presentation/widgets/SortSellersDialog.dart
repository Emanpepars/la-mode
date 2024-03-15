import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/sellers/presentation/manager/sellers_cubit.dart';
import 'package:la_mode/features/sellers/presentation/manager/sellers_state.dart';

import '../../../../core/utils/app_colors.dart';

class SortSellersDialog extends StatelessWidget {
  const SortSellersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellersCubit, SellersState>(
      builder: (context, state) => AlertDialog(
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomCheckbox(
                isChecked: SellersCubit.get(context)
                    .selectedFilterOptions
                    .contains('best_match'),
                title: 'Best Match',
                onTap: () {
                  SellersCubit.get(context)
                      .onMultiSelectFilterAlert('best_match');
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomCheckbox(
                onTap: () {
                  SellersCubit.get(context).onMultiSelectFilterAlert('rating');
                },
                isChecked: SellersCubit.get(context)
                    .selectedFilterOptions
                    .contains('rating'),
                title: "Rating",
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomCheckbox(
                onTap: () {
                  SellersCubit.get(context)
                      .onMultiSelectFilterAlert('most_popular');
                },
                isChecked: SellersCubit.get(context)
                    .selectedFilterOptions
                    .contains('most_popular'),
                title: 'Most Popular',
              ),
              SizedBox(
                height: 10.h,
              ),
              SortOptionTile(
                title: 'Seller Location',
                list: SellersCubit.get(context).location,
              ),
              SortOptionTile(
                title: 'Working Hours',
                list: SellersCubit.get(context).location,
              ),
              SortOptionTile(
                title: 'Brand',
                list: SellersCubit.get(context).brands,
              ),
              Container(
                height: 50.h,
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: MyButton(
                          textColor: AppColors.lightColor,
                          color: Colors.white,
                          text: 'Reset All',
                          onPressed: () {
                            SellersCubit.get(context).resetAllCheck();
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      flex: 7,
                      child: MyButton(
                          text: 'Apply',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function()? onTap;

  const CustomCheckbox(
      {super.key, required this.title, required this.isChecked, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: roboto16W500(),
          ),
          CuCheckBox(
            isChecked: isChecked,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class CuCheckBox extends StatelessWidget {
  final bool isChecked;

  final Function()? onTap;

  const CuCheckBox({required this.isChecked, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
          border: Border.all(
            color: isChecked ? AppColors.gold : AppColors.lightColor,
            width: 2.w,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: AppColors.gold,
                size: 18.sp,
              )
            : null,
      ),
    );
  }
}

class SortOptionTile extends StatelessWidget {
  final String title;
  final List<String> list;

  const SortOptionTile({
    super.key,
    required this.title,
    required,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellersCubit, SellersState>(
      builder: (context, state) => ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
        title: Text(
          title,
          style: roboto16W500(),
        ),
        children: List.generate(
          list.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: CustomCheckbox(
              title: list[index],
              isChecked: SellersCubit.get(context)
                  .selectedFilterOptions
                  .contains(list[index]),
              onTap: () {
                SellersCubit.get(context).onMultiSelectFilterAlert(list[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
