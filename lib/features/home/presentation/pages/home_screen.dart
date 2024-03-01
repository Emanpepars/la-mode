import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../manager/provider/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: PersistentTabView(
            context,
            controller: HomeCubit.get(context).controller,
            screens: HomeCubit.get(context).buildScreens(),
            items: HomeCubit.get(context).navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.

            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.sp),
                  topLeft: Radius.circular(20.sp)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:
                      const Offset(0, 3), // changes the position of the shadow
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.linear,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style12, // Choose the nav bar style with this property.
          ),
        ),
      ),
    );
  }
}
