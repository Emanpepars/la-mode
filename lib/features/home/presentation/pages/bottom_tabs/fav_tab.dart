import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_state.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            'WishList',
            style: roboto20(
              weight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: const NotificationIcon(
                notificationCount: 5,
              ),
            ),
          ],
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
                    'Your Wishlist Is Empty',
                    style: roboto20(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      'Looks like you don\'t have any favourite items yet.',
                      style: roboto16(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              MyButton(
                text: 'Start Shopping',
                onPressed: () {
                  HomeCubit.get(context).controller.index = 0;
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
