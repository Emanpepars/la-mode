import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:la_mode/features/home/data/repositories/home_data_repo.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:la_mode/features/home/domain/use_cases/home_use_case.dart';
import 'package:la_mode/main_cubit/main_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../data/data_sources/home_dto.dart';
import '../../../domain/repositories/home_domain_repo.dart';
import '../../pages/bottom_tabs/cart_tab/presentation/pages/cart_tab.dart';
import '../../pages/bottom_tabs/wishlist/presentation/pages/wishlist_tab.dart';
import '../../pages/bottom_tabs/home_tab/presentation/pages/home_tab_bar.dart';
import '../../pages/bottom_tabs/profile_tab.dart';
import '../../pages/bottom_tabs/settings_tab.dart';
import '../../pages/tab_view_tabs/all_tab.dart';
import '../../pages/tab_view_tabs/kids_tab_bar.dart';
import '../../pages/tab_view_tabs/men_tab_bar.dart';
import '../../pages/tab_view_tabs/women_tab_bar.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late Timer timer;
  late HomeDomainRepo homeDomainRepo;
  HomeDto homeDto;

  HomeCubit(this.homeDto) : super(HomeInitial()) {
    homeDomainRepo = HomeDataRepo(homeDto);
    timer = Timer.periodic(const Duration(milliseconds: 100000000), (timer) {
      nextPage();
    });
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentFlashSalePageIndex = 0;
  int currentTabIndex = 0;

  void onTabChanged(value) {
    currentTabIndex = value;
    emit(GetAllProductSuccess());
  }

  void onPageChanged(value) {
    currentFlashSalePageIndex = value;
    emit(GetAllProductSuccess());
  }

  var userBox = Hive.box(AppConstants.kUSerBox);

  List<Widget> tabBar = const [AllTab(), WomenTab(), MenTab(), KidTab()];
  List<Map<String, String>> collection = const [
    {
      "image": AppImages.winter,
      "text": "Winter",
    },
    {
      "image": AppImages.spring,
      "text": "Spring",
    },
    {
      "image": AppImages.summer,
      "text": "Summer",
    },
    {
      "image": AppImages.autumn,
      "text": "Autumn",
    },
  ];
  List<Map<String, String>> sales = const [
    {
      "image": AppImages.slider1,
      "title": "Special promo",
      "description": "Holiday edition promo on all summer collection",
      "discount": "75"
    },
    {
      "image": AppImages.slider2,
      "title": "Accessories sale",
      "description": "Accessories edition promo on all accessories",
      "discount": "30"
    },
    {
      "image": AppImages.slider3,
      "title": "Winter sale",
      "description": "Winter edition promo on all winter collection",
      "discount": "15"
    },
  ];
  List<Map<String, String>> categoriesAvatar = const [
    {
      "image": AppImages.tShirt,
      "title": "T-shirts",
    },
    {
      "image": AppImages.hoodie,
      "title": "Hoodies",
    },
    {
      "image": AppImages.pants,
      "title": "Pants",
    },
    {
      "image": AppImages.skirt,
      "title": "Skirts",
    },
    {
      "image": AppImages.footwear,
      "title": "Footwear",
    },
    {
      "image": AppImages.accessories,
      "title": "Accessories",
    },
    {
      "image": AppImages.more,
      "title": "More!",
    },
  ];

  List<PersistentBottomNavBarItem> navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: Theme.of(context).brightness == Brightness.light
            ? AppColors.silverDark
            : Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag),
        //icon: SvgPicture.asset(AppIcons.bag),
        title: "My Bag",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: Theme.of(context).brightness == Brightness.light
            ? AppColors.silverDark
            : Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Wishlist",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: Theme.of(context).brightness == Brightness.light
            ? AppColors.silverDark
            : Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: Theme.of(context).brightness == Brightness.light
            ? AppColors.silverDark
            : Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: Theme.of(context).brightness == Brightness.light
            ? AppColors.silverDark
            : Colors.white70,
      ),
    ];
  }

  List<Widget> buildScreens() {
    return [
      const HomeTab(),
      CartTab(
        userEntity: userBox.getAt(0),
      ),
      FavTab(
        userEntity: userBox.getAt(0),
      ),
      SettingsTab(
        userEntity: userBox.getAt(0),
      ),
      ProfileTab(
        userEntity: userBox.getAt(0),
      ),
    ];
  }

  PageController flashSalePageController = PageController(initialPage: 0);

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  ///--- Search ---///
  bool isSearch = false;
  TextEditingController searchTextEditingController = TextEditingController();

  ///---Flash sale---///
  void nextPage() {
    if (currentFlashSalePageIndex < sales.length - 1) {
      currentFlashSalePageIndex++;
    } else {
      currentFlashSalePageIndex = 0;
    }
    flashSalePageController.animateToPage(
      currentFlashSalePageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  ///--- settings Lang ---///

  String selectedLanguageOption = 'English';

  void language({context, String? newValue}) {
    selectedLanguageOption = newValue.toString();
    MainCubit.get(context).toggleLanguage(context, newValue.toString());

    emit(HomeSelectLanguageState());
  }

  ///--- settings Theme ---///

  String selectedThemeOption = 'Light';

  void theme({context, String? newValue}) {
    selectedThemeOption = newValue.toString();
    MainCubit.get(context).changeTheme(
        selectedThemeOption == 'Dark' ? ThemeMode.dark : ThemeMode.light);
    emit(HomeSelectThemeState());
  }

  ///--- get all product---///
  List<ProductDataEntity> products = [];
  List<ProductDataEntity> filteredProducts = [];

  getAllProduct() async {
    emit(GetAllProductLoading());
    HomeUseCase homeUseCase = HomeUseCase(homeDomainRepo);

    var response = await homeUseCase.getAllProduct();

    response.fold((l) => emit(GetAllProductError(l)), (r) {
      products = r.data!;
      emit(GetAllProductSuccess());
    });
  }

  ///--- On Search ---///

  getSearchProduct(String value) {
    emit(GetFilterProductLoading());
    searchTextEditingController.text.isEmpty
        ? isSearch = false
        : isSearch = true;
    filteredProducts = products
        .where((element) =>
            element.title!.toLowerCase().startsWith(value) ||
            element.title!.startsWith(value) ||
            element.brand!.name!.toLowerCase() == value ||
            element.brand!.name! == value)
        .toList();

    filteredProducts.isEmpty
        ? value.isNotEmpty
            ? emit(NotFoundFilterProduct())
            : emit(GetAllProductSuccess())
        : emit(GetAllProductSuccess());
  }
}
