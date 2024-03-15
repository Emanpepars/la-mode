import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_state.dart';

import '../../../../core/utils/app_colors.dart';

class SortAlertDialog extends StatelessWidget {
  const SortAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SortOptionTile(
              title: 'Price: High to Low',
              value: 'price_high_to_low',
              groupValue: HomeCubit.get(context).selectedSortOption,
            ),
            SortOptionTile(
              title: 'Price: Low to High',
              value: 'price_low_to_high',
              groupValue: HomeCubit.get(context).selectedSortOption,
            ),
            SizedBox(
              height: 5.h,
            ),
            CuCheckBox(
              title: 'Rating',
              selectedFilterOption: 'Rating',
              isChecked: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('Rating'),
            ),
            CuCheckBox(
              title: 'Newest',
              selectedFilterOption: 'newest',
              isChecked: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('newest'),
            ),
            CuCheckBox(
              title: 'Best Matches',
              selectedFilterOption: 'best_matches',
              isChecked: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_matches'),
            ),
            CuCheckBox(
              title: 'Best Popular',
              selectedFilterOption: 'best_popular',
              isChecked: HomeCubit.get(context)
                  .selectedFilterOptions
                  .contains('best_popular'),
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

class CuCheckBox extends StatelessWidget {
  final String title;
  final String selectedFilterOption;

  final bool isChecked;

  const CuCheckBox(
      {required this.title,
      required this.isChecked,
      required this.selectedFilterOption,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: CheckboxListTile(
        checkColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 2.w),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.sp),
          ),
        ),
        activeColor: AppColors.gold,
        title: Text(
          title,
          style: roboto16W500(),
        ),
        value: isChecked,
        onChanged: (value) {
          HomeCubit.get(context).onMultiSelectFilterAlert(selectedFilterOption);
        },
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
    return SizedBox(
      height: 30.h,
      child: RadioListTile(
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.gold,
        title: Text(
          title,
          style: roboto16W500(),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          HomeCubit.get(context).onSingleFilterAlertChanged(value);
        },
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
