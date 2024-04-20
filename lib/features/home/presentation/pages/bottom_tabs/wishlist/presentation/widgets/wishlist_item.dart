import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../core/utils/app_icons.dart';
import '../manager/wishlist_cubit.dart';
import '../manager/wishlist_state.dart';

class WishlistItem extends StatelessWidget {
  final ProductDataEntity product;

  const WishlistItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            12.sp,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      height: 100.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.sp),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CachedNetworkImage(
                    width: 110.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                    imageUrl: product.imageCover!,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                        width: 110.w,
                        height: 100.h,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: AppColors.lightGray,
                      child: BlocBuilder<WishlistCubit, WishlistState>(
                        builder: (context, state) {
                          if (WishlistCubit.get(context)
                              .wishlist
                              .any((element) => element.id == product.id)) {
                            return CustomInkWell(
                              onTap: () {
                                WishlistCubit.get(context)
                                    .removeWish(product.id!);
                              },
                              child: Lottie.asset(
                                repeat: false,
                                "assets/animation/favorite.json",
                              ),
                            );
                          } else {
                            return CustomInkWell(
                              onTap: () {
                                WishlistCubit.get(context).addWish(product.id!);
                              },
                              child: Image(
                                image: const AssetImage(
                                  AppIcons.heart,
                                ),
                                color: AppColors.lightColor,
                                width: 18.w,
                                height: 20.h,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                product.title!,
                                style: roboto14(weight: FontWeight.w600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            product.quantity! < 100
                                ? Text(
                                    'Low in Stock',
                                    style: roboto12W400().copyWith(
                                      color: AppColors.silverDark,
                                    ),
                                  )
                                : Text(
                                    'Available in Stock',
                                    style: roboto12W400().copyWith(
                                      color: AppColors.silverDark,
                                    ),
                                  ),
                          ],
                        ),
                        Container(
                          width: 45.sp,
                          height: 45.sp,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gold),
                            borderRadius: BorderRadius.all(
                              Radius.circular(26.sp),
                            ),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  "${product.brand!.image}"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              backgroundColor: AppColors.gold,
                              radius: 10.sp,
                              child: Icon(
                                Icons.add,
                                size: 16.sp,
                                color: AppColors.lightColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: product.priceAfterDiscount == null ||
                                product.priceAfterDiscount == product.price
                            ? Text(
                                "\$${product.price}",
                                style: roboto18W500()
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${product.priceAfterDiscount}",
                                    style: roboto18W500()
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${product.price}',
                                        style: roboto12W400().copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColors.silverDark,
                                        ),
                                      ),
                                      Text(
                                        '${(((product.price! - product.priceAfterDiscount!) / (product.price! + product.priceAfterDiscount!)) * 100).toInt()}%',
                                        style: roboto12W400().copyWith(
                                          color: AppColors.silverDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 129.w,
                        child: MyYellowButton(
                          text: 'Add To Cart',
                          productId: product.id!,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
