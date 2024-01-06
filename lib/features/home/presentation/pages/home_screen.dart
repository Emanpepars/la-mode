import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                //snap: true,
                //  pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu, color: AppColors.primary),
                      ),
                      title: Text(
                        "Home",
                        style: roboto20(weight: FontWeight.w700),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 7.w),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_on,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(110.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.silverM),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: TextField(
                                    cursorColor: AppColors.silverDark,
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: roboto16().copyWith(
                                        color: AppColors.silverDark,
                                      ),
                                      prefixIcon: const Image(
                                        image: AssetImage(
                                          AppIcons.search,
                                        ),
                                        color: AppColors.silverDark,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 9.w),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(AppIcons.filter),
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: const Text("FOR YOU"),
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Expanded(
                              flex: 2,
                              child: TabBar(
                                labelColor: AppColors.gold,
                                labelStyle: roboto14(),
                                unselectedLabelColor: AppColors.primary,
                                unselectedLabelStyle: roboto12W400(),
                                indicatorColor: AppColors.gold,
                                indicatorSize: TabBarIndicatorSize.label,
                                isScrollable: true,
                                tabs: const [
                                  Tab(text: 'All'),
                                  Tab(text: 'Women'),
                                  Tab(text: 'Men'),
                                  Tab(text: 'Kids'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: homeProvider.tabBar[0],
              ),
              const Center(child: Text('Tab 2 content')),
              const Center(child: Text('Tab 3 content')),
              const Center(child: Text('Tab 3 content')),
            ],
          ),
        ),
      ),
    );
  }
}
