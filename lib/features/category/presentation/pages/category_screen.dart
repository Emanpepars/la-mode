import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce_app/features/category/presentation/manager/category_cubit.dart';
import 'package:my_ecommerce_app/features/category/presentation/manager/category_state.dart';
import '../../../../core/utils/app_components.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryTitle;

  const CategoryScreen({required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) => Scaffold(
          body: FirstPart(
            appBarTitle: categoryTitle,
            currentTabIndex: CategoryCubit.get(context).currentTabIndex,
            tabBarView: [
              SingleChildScrollView(
                child: CategoryCubit.get(context).tabBar[0],
              ),
              const Center(child: Text('ًWoman content')),
              const Center(child: Text('Men content')),
              const Center(child: Text('Kids content')),
            ],
            actions: [
              const BagIcon(bagCount: 4),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
            onTabChanged: CategoryCubit.get(context).onTabChanged,
          ),
        ),
      ),
    );
  }
}
