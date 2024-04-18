import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_state.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class FavTab extends StatelessWidget {
  final UserEntity userEntity;

  const FavTab({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: ConstAppBar(
          title: 'Wishlist'.tr(),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Items(count: 0),
              Column(
                children: [
                  Image.asset(
                    AppImages.wishlist,
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your Wishlist Is Empty'.tr(),
                    style: roboto20(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      "Looks like you do not have any favourite items yet."
                          .tr(),
                      style: roboto16(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              MyButton(
                text: 'Start Shopping'.tr(),
                onPressed: () {
                  HomeCubit.get(context).controller.index = 0;
                },
              ),
            ],
          ),
        ),
        drawer: MyDrawer(
          userName: userEntity.name,
          userEmail: userEntity.email,
        ),
      ),
    );
  }
}
