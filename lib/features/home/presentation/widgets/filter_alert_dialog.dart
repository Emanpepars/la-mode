import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_state.dart';

import '../../../../core/utils/app_colors.dart';

class FilterAlertDialog extends StatefulWidget {
  const FilterAlertDialog({super.key});

  @override
  FilterAlertDialogState createState() => FilterAlertDialogState();
}

class FilterAlertDialogState extends State<FilterAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => AlertDialog(
        contentPadding:
            EdgeInsets.only(left: 2.w, top: 6.h, right: 0.w, bottom: 6.h),
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              activeColor: AppColors.gold,
              title: const Text('Price: High to Low'),
              value: 'price_high_to_low',
              groupValue: HomeCubit.get(context).selectedSortOption,
              onChanged: (value) {
                HomeCubit.get(context).onSingleFilterAlertChanged(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              activeColor: AppColors.gold,
              title: const Text('Price: Low to High'),
              value: 'price_low_to_high',
              groupValue: HomeCubit.get(context).selectedSortOption,
              onChanged: (value) {
                HomeCubit.get(context).onSingleFilterAlertChanged(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            CheckboxListTile(
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: const Text('Rating'),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('Rating'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('Rating');
              },
            ),
            CheckboxListTile(
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: const Text('Newest'),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('newest'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('newest');
              },
            ),
            CheckboxListTile(
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: const Text('Best Matches'),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_matches'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('best_matches');
              },
            ),
            CheckboxListTile(
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: const Text('Best Popular'),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_popular'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('best_popular');
              },
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: MyButton(
                        textColor: AppColors.primary,
                        color: Colors.white,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
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
