import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/category/presentation/manager/category_cubit.dart';
import 'package:la_mode/features/category/presentation/manager/category_state.dart';
import '../../../../core/utils/app_components.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryTitle;

  const CategoryScreen({required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) => Scaffold(
        body: FirstPart(
          appBarTitle: categoryTitle,
          withBag: true,
          currentTabIndex: CategoryCubit.get(context).currentTabIndex,
          tabBarView: [
            SingleChildScrollView(
              child: CategoryCubit.get(context).tabBar[0],
            ),
            const Center(child: Text('ًWoman content')),
            const Center(child: Text('Men content')),
            const Center(child: Text('Kids content')),
          ],
          onTabChanged: CategoryCubit.get(context).onTabChanged,
        ),
        drawer: const MyDrawer(
          userName: '',
          userEmail: '',
        ),
      ),
    );
  }
}
