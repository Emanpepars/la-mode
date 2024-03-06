# la_mode

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var homeProvider = Provider.of<HomeProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.lightGray,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.menu, color: AppColors.primary),
//         ),
//         title: Text(
//           "Home",
//           style: roboto20(weight: FontWeight.w700),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 7.w),
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.notifications_on,
//                 color: AppColors.primary,
//               ),
//             ),
//           ),
//         ],
//
//       ),
//       body: DefaultTabController(
//         length: 4,
//         child: SingleChildScrollView(
//           child: Container(
//             color: AppColors.lightGray,
//             height: 1500.h,
//             padding: EdgeInsets.symmetric(
//               vertical: 10.h,
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 40.h,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 15.w),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: AppColors.silverM),
//                               borderRadius: const BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                             ),
//                             padding: EdgeInsets.symmetric(vertical: 2.h),
//                             child: TextField(
//                               cursorColor: AppColors.silverDark,
//                               decoration: InputDecoration(
//                                 hintText: "Search",
//                                 hintStyle: roboto16().copyWith(
//                                   color: AppColors.silverDark,
//                                 ),
//                                 prefixIcon: const Image(
//                                   image: AssetImage(
//                                     AppIcons.search,
//                                   ),
//                                   color: AppColors.silverDark,
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 9.w),
//                         child: IconButton(
//                           onPressed: () {},
//                           icon: const Image(
//                             image: AssetImage(AppIcons.filter),
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 10.h,
//                 // ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20.w),
//                         child: const Text("FOR YOU"),
//                       ),
//                     ),
//                     SizedBox(width: 30.w),
//                     Expanded(
//                       flex: 2,
//                       child: TabBar(
//                         labelColor: AppColors.gold,
//                         labelStyle: roboto14(),
//                         unselectedLabelColor: AppColors.primary,
//                         unselectedLabelStyle: roboto12W400(),
//                         indicatorColor: AppColors.gold,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         isScrollable: true,
//                         tabs: const [
//                           Tab(text: 'All'),
//                           Tab(text: 'Women'),
//                           Tab(text: 'Men'),
//                           Tab(text: 'Kids'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       // Content for Tab 1
//                       homeProvider.tabBar[0],
//                       // Content for Tab 2
//                       const Center(child: Text('Content for Tab 2')),
//
//                       // Content for Tab 3
//                       const Center(child: Text('Content for Tab 3')),
//                       // Content for Tab 4
//                       const Center(child: Text('Content for Tab 4')),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }