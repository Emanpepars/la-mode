import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import 'package:la_mode/main_cubit/main_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../main_cubit/main_state.dart';
import '../manager/provider/home_state.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity userEntity;

  const HomeScreen({required this.userEntity, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAlertDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is ConnectionPlusNotConnected ||
            state is InternetCheckerNotConnected) {
          if (!isAlertDialogOpen) {
            setState(() {
              isAlertDialogOpen = true;
            });
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const ConnectionErrorAlertDialogWidget(),
            );
          }
        } else if (state is ConnectionPlusConnected || state is  InternetCheckerConnected) {
          if (isAlertDialogOpen) {
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              isAlertDialogOpen = false;
            }); // Close dialog
          }
        }
      },
      builder: (context, state) => BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: PersistentTabView(
            context,
            controller: HomeCubit.get(context).controller,
            screens: HomeCubit.get(context).buildScreens(),
            items: HomeCubit.get(context).navBarsItems(context),
            confineInSafeArea: true,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.sp),
                  topLeft: Radius.circular(20.sp)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.linear,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style12,
          ),
          drawer: MyDrawer(
            userName: widget.userEntity.name,
            userEmail: widget.userEntity.email,
          ),
        ),
      ),
    );
  }
}
