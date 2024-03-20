import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/category/presentation/manager/category_cubit.dart';
import 'package:la_mode/features/category/presentation/manager/category_state.dart';

import '../../../../core/utils/app_colors.dart';

class SortCatDialog extends StatelessWidget {
  const SortCatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) => AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SortOptionTile(
              title: 'Price: High to Low',
              value: 'price_high_to_low',
              groupValue: CategoryCubit.get(context).selectedSortOption,
            ),
            SortOptionTile(
              title: 'Price: Low to High',
              value: 'price_low_to_high',
              groupValue: CategoryCubit.get(context).selectedSortOption,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomCheckbox(
              title: 'Rating',
              isChecked: CategoryCubit.get(context)
                  .selectedFilterOptions
                  .contains('Rating'),
              onTap: () {
                CategoryCubit.get(context).onMultiSelectFilterAlert('Rating');
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomCheckbox(
              title: 'Newest',
              isChecked: CategoryCubit.get(context)
                  .selectedFilterOptions
                  .contains('newest'),
              onTap: () {
                CategoryCubit.get(context).onMultiSelectFilterAlert('newest');
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomCheckbox(
              title: 'Best Matches',
              isChecked: CategoryCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_matches'),
              onTap: () {
                CategoryCubit.get(context)
                    .onMultiSelectFilterAlert('best_matches');
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomCheckbox(
              title: 'Best Popular',
              isChecked: CategoryCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_popular'),
              onTap: () {
                CategoryCubit.get(context)
                    .onMultiSelectFilterAlert('best_popular');
              },
            ),
            SizedBox(
              height: 10.h,
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
                          CategoryCubit.get(context).resetAllCheck();
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
            color: isChecked ? AppColors.gold : AppColors.silverDark,
            width: 1.w,
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
  final String value;
  final String groupValue;

  const SortOptionTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            CategoryCubit.get(context).onSingleFilterAlertChanged(value);
          },
          child: Text(
            title,
            style: roboto16W500(),
          ),
        ),
        SizedBox(
          width: 22.w,
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (newValue) {
              CategoryCubit.get(context).onSingleFilterAlertChanged(newValue);
            },
            activeColor: AppColors.gold,
          ),
        ),
      ],
    );
  }
}
