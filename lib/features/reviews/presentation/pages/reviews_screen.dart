import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';
import 'package:my_ecommerce_app/features/reviews/presentation/manager/reviews_cubit.dart';
import 'package:my_ecommerce_app/features/reviews/presentation/manager/reviews_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(),
      child: BlocConsumer<ReviewsCubit, ReviewsState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBarWithBag(
            appBarTitle: 'Reviews',
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: const AssetImage(AppImages.fakeSeller),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 260.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: Text(
                                    ReviewsCubit.get(context)
                                        .reviews[index]
                                        .userName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: roboto16W500(),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${ReviewsCubit.get(context).reviews[index].daysLeft}",
                                      style: roboto14(
                                          weight: FontWeight.w600,
                                          color: AppColors.silverDark),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                      child: Text(
                                        "days ago",
                                        style: roboto14(
                                            weight: FontWeight.w600,
                                            color: AppColors.silverDark),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RatingBarIndicator(
                            rating:
                                ReviewsCubit.get(context).reviews[index].rate,
                            unratedColor: AppColors.silverM,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.sp,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    ReviewsCubit.get(context).reviews[index].review,
                    style: roboto14(color: AppColors.silverDark),
                  ),
                ],
              ),
              itemCount: ReviewsCubit.get(context).reviews.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 20.h,
                color: AppColors.lightGray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
