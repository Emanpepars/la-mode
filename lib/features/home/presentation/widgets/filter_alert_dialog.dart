import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';
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
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              contentPadding: EdgeInsets.only(left: 6.w),
              activeColor: AppColors.gold,
              title: Text(
                'Price: High to Low',
                style: roboto16W500(),
              ),
              value: 'price_high_to_low',
              groupValue: HomeCubit.get(context).selectedSortOption,
              onChanged: (value) {
                HomeCubit.get(context).onSingleFilterAlertChanged(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              contentPadding: EdgeInsets.only(left: 6.w),
              activeColor: AppColors.gold,
              title: Text(
                'Price: Low to High',
                style: roboto16W500(),
              ),
              value: 'price_low_to_high',
              groupValue: HomeCubit.get(context).selectedSortOption,
              onChanged: (value) {
                HomeCubit.get(context).onSingleFilterAlertChanged(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            CheckboxListTile(
              activeColor: AppColors.gold,
              contentPadding: EdgeInsets.only(
                left: 6.w,
              ),
              checkboxShape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.gold,
                ),
                borderRadius: BorderRadius.circular(4.sp),
              ),
              title: Text(
                'Rating',
                style: roboto16W500(),
              ),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('Rating'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('Rating');
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.only(left: 6.w),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: Text(
                'Newest',
                style: roboto16W500(),
              ),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('newest'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('newest');
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.only(left: 6.w),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: Text(
                'Best Matches',
                style: roboto16W500(),
              ),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_matches'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('best_matches');
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.only(left: 6.w),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              activeColor: AppColors.gold,
              title: Text(
                'Best Popular',
                style: roboto16W500(),
              ),
              value: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_popular'),
              onChanged: (value) {
                HomeCubit.get(context).onMultiSelectFilterAlert('best_popular');
              },
            ),
            Container(
              height: 50.h,
              padding: EdgeInsets.only(right: 4.w, left: 4.w),
              child: Row(
                children: [
                  Expanded(
                    child: MyButton(
                        textColor: AppColors.primary,
                        color: Colors.transparent,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: 20.w,
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
