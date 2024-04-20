import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_state.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../../../core/utils/app_components.dart';
import '../../../../../../../../core/utils/app_icons.dart';
import '../../../wishlist/presentation/manager/wishlist_cubit.dart';
import '../../../wishlist/presentation/manager/wishlist_state.dart';
import '../../domain/entities/cart_entity.dart';

class BagItem extends StatelessWidget {
  final CartProducts productItem;

  const BagItem({
    super.key,
    required this.productItem,
  });

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
      height: 110.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CachedNetworkImage(
                    width: 110.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                    imageUrl: productItem.product!.imageCover!,
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
                          if (WishlistCubit.get(context).wishlist.any(
                              (element) =>
                                  element.id == productItem.product!.id)) {
                            return CustomInkWell(
                              onTap: () {
                                WishlistCubit.get(context)
                                    .removeWish(productItem.product!.id!);
                              },
                              child: Lottie.asset(
                                repeat: false,
                                "assets/animation/favorite.json",
                              ),
                            );
                          } else {
                            return CustomInkWell(
                              onTap: () {
                                WishlistCubit.get(context)
                                    .addWish(productItem.product!.id!);
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 170.w,
                              child: Text(
                                productItem.product!.title!,
                                style: roboto14(
                                  weight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 160.w,
                              child: Row(
                                children: [
                                  Text(
                                    'Size: '.tr(),
                                    style: roboto12W400().copyWith(
                                      color: AppColors.silverDark,
                                    ),
                                  ),
                                  Text(
                                    'One Size',
                                    style: roboto12W400()
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            CartCubit.get(context)
                                .removeItemFromCart(productItem.product!.id!);
                          },
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      '\$${productItem.price!}',
                      style: roboto16W500().copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            CartCubit.get(context).decreaseItemCountCart(
                              productItem.product!.id!,
                              productItem.count! - 1,
                            );
                          },
                          icon: const Icon(Icons.remove),
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.lightYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.sp),
                            ),
                          ),
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13.w),
                            child: Text(
                              productItem.count.toString(),
                              style: roboto18W500(),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            CartCubit.get(context).increaseItemCountCart(
                              productItem.product!.id!,
                              productItem.count! + 1,
                            );
                          },
                          icon: const Icon(Icons.add),
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.lightYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
