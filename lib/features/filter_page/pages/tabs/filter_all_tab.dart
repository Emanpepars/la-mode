import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/filter_page/management/filter_cubit.dart';
import 'package:la_mode/features/filter_page/widgets/cu_check_filter_box.dart';
import 'package:la_mode/features/filter_page/widgets/cu_filter_botton.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../product_details/presentation/widgets/color_container.dart';
import '../../../product_details/presentation/widgets/property_button.dart';
import '../../management/filter_state.dart';

class FilterAllTab extends StatelessWidget {
  const FilterAllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: BlocConsumer<FilterCubit, FilterState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///---Sizes---///
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategoryName(title: "Size"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Size guide",
                        style: roboto14(
                          weight: FontWeight.w500,
                          color: AppColors.silverDark,
                        ).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 45.h,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: FilterCubit.get(context).sizes.length,
                      itemBuilder: (context, index) {
                        return PropertyButton(
                          color: FilterCubit.get(context).sizeSelectedIndex ==
                                  index
                              ? AppColors.lightColor
                              : AppColors.lightGray,
                          text: FilterCubit.get(context).sizes[index],
                          onTap: () {
                            FilterCubit.get(context).onSizeTap(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),

            ///--- Price Range ---///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Price"),
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${FilterCubit.get(context).startValue.toStringAsFixed(0)}",
                        style: roboto16W500(),
                      ),
                      Text(
                        "\$${FilterCubit.get(context).endValue.toStringAsFixed(0)}",
                        style: roboto16W500(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                  child: RangeSlider(
                    values: RangeValues(
                      FilterCubit.get(context).startValue,
                      FilterCubit.get(context).endValue,
                    ),
                    max: 400,
                    min: 0,
                    onChanged: (values) {
                      FilterCubit.get(context).onChangedSlider(values);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),

            ///--- Rating ---///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Rating"),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 20.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: FilterCubit.get(context).rate.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    FilterCubit.get(context).onRateTap(index);
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: FilterCubit.get(context).rateIndex == index
                            ? const BorderSide()
                            : BorderSide.none,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: FilterCubit.get(context).rateIndex == index
                              ? AppColors.gold
                              : AppColors.lightColor,
                          size: 15.sp,
                        ),
                        Text(
                          "${FilterCubit.get(context).rate[index]}",
                          style: roboto14(
                            weight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20.w,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            ///---Colors---///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Colors"),
            ),
            SizedBox(
              height: 50.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: FilterCubit.get(context).colors.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? CircleAvatar(
                        radius: 18.sp,
                        backgroundColor: AppColors.silverDark,
                        child: Text(
                          'All',
                          style: roboto16W500(color: Colors.white),
                        ),
                      )
                    : ColorContainer(
                        onTap: () {
                          FilterCubit.get(context).onColorTap(index - 1);
                        },
                        index: index - 1,
                        color: FilterCubit.get(context).colors[index - 1],
                        colorIndex: FilterCubit.get(context).colorIndex,
                      ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 5.w,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            ///--- Brand ---///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Brand"),
            ),
            SizedBox(
              height: 5.h,
            ),

            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 5.w / 1.w,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: FilterCubit.get(context).brands.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    FilterCubit.get(context).onMultiSelectFilterAlert(
                      FilterCubit.get(context).brands[index],
                    );
                  },
                  child: CustomCheckbox(
                    title: FilterCubit.get(context).brands[index],
                    isChecked: FilterCubit.get(context)
                        .selectedFilterOptions
                        .contains(FilterCubit.get(context).brands[index]),
                    onTap: () {
                      FilterCubit.get(context).onMultiSelectFilterAlert(
                        FilterCubit.get(context).brands[index],
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),

            ///--Seller --///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Seller"),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 60.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => index == 0
                    ? CircleAvatar(
                        radius: 32.sp,
                        backgroundColor: AppColors.lightGray,
                        child: Text(
                          'All',
                          style: roboto16W500(),
                        ),
                      )
                    : CircleAvatar(
                        radius: 30.sp,
                        backgroundImage: const AssetImage(AppImages.fakeSeller),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CircleAvatar(
                            backgroundColor: AppColors.gold,
                            radius: 12.sp,
                            child: Icon(
                              Icons.add,
                              color: AppColors.lightColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const CategoryName(title: "Collection"),
            ),
            SizedBox(
              height: 5.h,
            ),

            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              itemCount: FilterCubit.get(context).collection.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 4.w / 1.w),
              itemBuilder: (context, index) {
                return CuCheckButton(
                  title: FilterCubit.get(context).collection[index],
                  isChecked: FilterCubit.get(context)
                      .selectedFilterOptions
                      .contains(FilterCubit.get(context).collection[index]),
                  onTap: () {
                    FilterCubit.get(context).onMultiSelectCollection(
                      FilterCubit.get(context).collection[index],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
