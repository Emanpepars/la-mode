import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/edit_profile/presentation/pages/edit_profile_screen.dart';
import 'package:la_mode/features/home/presentation/widgets/profile_row.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../register/domain/entities/user_entity.dart';

class ProfileTab extends StatelessWidget {
  final UserEntity userEntity;

  const ProfileTab({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConstAppBar(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.sp,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.fakeSeller,
                      ),
                    ),
                    border: Border.all(
                      color: AppColors.gold,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        60.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userEntity.name,
                    style: roboto16().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: EditProfileScreen(
                          userEntity: userEntity,
                        ),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.lightColor,
                    ),
                  ),
                ],
              ),
              Text(
                userEntity.email,
                style: roboto16(
                  color: AppColors.silverDark,
                ).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const ProfileRow(
                title: 'My orders',
                count: 10,
                rowIcon: Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Inbox',
                count: 0,
                rowIcon: Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Promocode / Vouchers',
                count: 0,
                rowIcon: Icon(
                  Icons.mail_outline,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Payment methods',
                count: 0,
                rowIcon: Icon(
                  Icons.payment,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Delivery address',
                count: 0,
                rowIcon: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Following sellers',
                count: 0,
                rowIcon: Icon(
                  Icons.people_alt_outlined,
                  color: AppColors.lightColor,
                ),
              ),
              const ProfileRow(
                title: 'Recently viewed',
                count: 0,
                rowIcon: Icon(
                  Icons.access_time_rounded,
                  color: AppColors.lightColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: AppColors.lightColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Logout',
                    style: roboto16().copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.gold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        userName: userEntity.name,
        userEmail: userEntity.email,
      ),
    );
  }
}
