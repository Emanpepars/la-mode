import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CityDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final Function(String?)? onChange;
  final Function(bool)? onMenuStateChange;
  final TextEditingController? controller;

  const CityDropdown(
      {super.key,
      required this.items,
      required this.value,
      required this.onChange,
      required this.onMenuStateChange,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.0.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.location_on_outlined,
              color: AppColors.silverDark,
            ),
          ),
          Expanded(
            flex: 16,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select city',
                  style:
                      robotoTitleField().copyWith(color: AppColors.silverDark),
                ),
                items: items,
                value: value,
                onChanged: onChange,
                buttonStyleData: ButtonStyleData(
                  height: 35.h,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h,
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 30.h,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: controller,
                  searchInnerWidgetHeight: 50.h,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      top: 10.h,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: controller,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        hintText: 'Search for a city...',
                        hintStyle: roboto12W400(color: AppColors.silverDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                onMenuStateChange: onMenuStateChange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
