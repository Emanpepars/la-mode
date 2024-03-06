import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_state.dart';
import '../../../../../core/utils/app_components.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => FirstPart(
        appBarTitle: 'Home'.tr(),
        leadingIcon: Icons.menu,
        currentTabIndex: HomeCubit.get(context).currentTabIndex,
        tabBarView: [
          SingleChildScrollView(
            child: HomeCubit.get(context).tabBar[0],
          ),
          const Center(child: Text('ًWoman content')),
          const Center(child: Text('Men content')),
          const Center(child: Text('Kids content')),
        ],
        onTabChanged: HomeCubit.get(context).onTabChanged,
      ),
    );
  }
}
