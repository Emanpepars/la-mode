import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/all_tab.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/kids_tab_bar.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/men_tab_bar.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/women_tab_bar.dart';

import '../../../home/domain/entities/prduct_entity.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<Widget> tabBar = const [AllTab(), WomenTab(), MenTab(), KidTab()];

  int currentTabIndex = 0;

  void onTabChanged(value) {
    currentTabIndex = value;
    emit(CategoryOnTabChangedState());
  }

  var sneaker3d = ProductDataEntity(
    sold: 100,
    images: [
      'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/sneakers%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
      'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/sneakers%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
      'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/sneakers%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
    ],
    subcategory: [
      SubcategoryEntity(
        id: "6439d5b90049ad0b52b90048",
        name: 'Sneakers',
        slug: 'sneakers',
        category: 'Shoes',
      ),
    ],
    ratingsQuantity: 50,
    id: '1',
    title: 'White Sneakers',
    slug: 'white-sneakers',
    description:
        'Step out in style with these trendy white sneakers. Crafted with durable materials, these sneakers are perfect for everyday wear. Whether you\'re running errands or hitting the gym, these sneakers will keep you comfortable and stylish. Pair them with jeans and a t-shirt for a casual look, or dress them up with a dress for a more fashion-forward ensemble.',
    quantity: 10,
    price: 250,
    imageCover:
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/sneakers%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
    category: CategoryEntity(
      id: '6439d58a0049ad0b52b9003f',
      name: 'Shoes',
      slug: 'shoes',
      image:
          'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
    ),
    brand: BrandEntity(
      id: '64089bbe24b25627a253158b',
      name: 'Nike',
      slug: 'nike',
      image:
          'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
    ),
    ratingsAverage: 4.9,
    priceAfterDiscount: 250,
  );
  List<ProductDataEntity> products = [
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: "6439d5b90049ad0b52b90048",
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Brown Pants',
      slug: 'brown-pants',
      description:
          'Stay stylish and comfortable with these classic brown pants. Made from high-quality fabric, these pants are perfect for any occasion. Pair them with a casual shirt for a laid-back look or dress them up with a blazer for a more formal ensemble. With their versatile design, these pants are a must-have addition to your wardrobe.',
      quantity: 10,
      price: 250,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.9,
      priceAfterDiscount: 250,
    ),
    ProductDataEntity(
      sold: 990,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F2%2F2.1.jpg?alt=media&token=c82b467f-4996-4073-907e-93438943fbc5',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F2%2F2.2.jpg?alt=media&token=10b32236-96bf-44c4-8705-31b5461d4b80',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F2%2F2.3.png?alt=media&token=824945b0-d009-4719-af01-86c6e8e3176e',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Wide Leg Jeans with Heart Print',
      slug: 'product-1',
      description:
          'Experience the captivating combination of a stunning medium wash, heart pattern, and delightful details! These wide leg jeans feature a zipper fly, button and pocket details, a high waistline, and a long, loose fit. Crafted with 92% cotton, 5% polyester, and 3% viscose, they\'re machine washable and designed to last. Make a statement when you step out wearing these beautiful, unlined jeans!',
      quantity: 10,
      price: 200,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F2%2F2.1.jpg?alt=media&token=c82b467f-4996-4073-907e-93438943fbc5',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.8,
      priceAfterDiscount: 200,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Women jeans 2024',
      slug: 'product-1',
      description:
          'Season : All season Thickness : Regular Age : MIDDLE AGE Style : High Street Jeans Style : STRAIGHT Fit Type : Regular Fabric Type : Softener Decoration : Pockets Waist Type : HIGH Length : Full Length Material : Polyester Gender : WOMEN Item Type : JEANS Elasticity : Non Strech.',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F3.jpg?alt=media&token=428421d3-717b-4c05-98e9-97b756a8f9d3',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Aoaiiys Jeans ',
      slug: 'product-1',
      description:
          'Season : All season Release Date : Autumn 2024 Thickness : Regular Age : MIDDLE AGE Style : Casual Jeans Style : Wide Leg Pants Fit Type : Regular Fabric Type : Cotton denim Decoration : Pockets Waist Type : HIGH Closure Type : Drawstring Wash : Medium Length : Full Length Material : COTTON,Polyester,Viscose Gender : WOMEN Item Type : JEANS Brand Name : Aoaiiys Elasticity : Non Strech Product Size Size: S, Waist: 60 cm,Hip: 114 cm, Length: 103 cm Size: M, Waist: 64 cm, Hip: 118 cm, Length: 104 c ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F4.jpg?alt=media&token=a1888bfe-9a3c-48c7-9dc3-faffd53762db',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Aoaiiys Jeans ',
      slug: 'product-1',
      description:
          'Season : All season Release Date : Autumn 2024 Thickness : Regular Age : MIDDLE AGE Style : Casual Jeans Style : Wide Leg Pants Fit Type : Regular Fabric Type : Cotton denim Decoration : Pockets Waist Type : HIGH Closure Type : Drawstring Wash : Medium Length : Full Length Material : COTTON,Polyester,Viscose Gender : WOMEN Item Type : JEANS Brand Name : Aoaiiys Elasticity : Non Strech Product Size Size: S, Waist: 60 cm,Hip: 114 cm, Length: 103 cm Size: M, Waist: 64 cm, Hip: 118 cm, Length: 104 c ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F5.jpg?alt=media&token=a35d54c1-f880-45a8-9d7a-ed19940943a6',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Jeans Women\'s Clothing Y2K',
      slug: 'product-1',
      description:
          'Solid Color Wide Leg Pants Button Hole Pocket Loose Wash Trousers A010 blue-M Opens a new tabApplicable Season : Spring and Summer Applicable Scene : Shopping Decoration : HOLE Pattern Type : Solid Style : High Street Length : Full Length Thickness : Mid weight Jeans Style : Wide Leg Pants Fabric Type : Plaid Waist Type : MID Fit Type : LOOSE Closure Type : Button Fly Brand Name : Zen RoicSea Gender : MEN ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F6.jpg?alt=media&token=34825390-a4d1-44f3-9cdd-a2572091e6d2',
      category: CategoryEntity(
        id: '6439d5b90049ad0b52b90048',
        name: 'Men\'s Fashion',
        slug: 'men\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'New American street pants',
      slug: 'product-1',
      description:
          'ins high street trendy stitching jeans female spring and autumn wide-leg denim Blue-XXL Opens a new tabSeason : Spring/Summer Release Date : Summer 2023 Thickness : Regular Age : JUNIOR Model Number : 1931-43 Style : Streetwear Jeans Style : STRAIGHT Fit Type : LOOSE Fabric Type : Cotton elastic denim Decoration : Button,Pockets,HOLE,Fake Zippers,Washed,vintage,Contrast Color Waist Type : HIGH Closure Type : Zipper Fly Wash : Medium Length : Full Length Material : COTTON,Polyester Gender : WOMEN Item Type : JEANS Elasticity : Non Strech',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F7.jpg?alt=media&token=86378228-eaba-46a1-8c65-a0f6ef9c3f44',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'WNew Spice Girl high-waisted straight leg',
      slug: 'product-1',
      description:
          'Retro loose casual floor length pants Women\'s street fashion jeans Light Blue-SOpens a new tabSeason : All season Thickness : Regular Age : MIDDLE AGE Style : High Street Jeans Style : STRAIGHT Fit Type : Regular Fabric Type : Softener Decoration : Pockets Waist Type : HIGH Length : Full Length Material : Polyester Gender : WOMEN Item Type : JEANS Elasticity : Non Strech',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F8.jpg?alt=media&token=360ef926-c583-4c33-a9b4-fdf5bffa0913',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Retro High Street Cargo Pants ',
      slug: 'product-1',
      description:
          'Multi-Pocket Blue Washed Y2k Fashion High Waist Jeans Couple Harajuku Simple Casual Wide Leg Pants High Quality5-XXL Opens a new tabSeason : All season Release Date : Autumn Thickness : regular Age : JUNIOR Place Of Origin : China (mainland) Style : High Street Jeans Style : Cargo Pants Fit Type : LOOSE Fabric Type : Softener Decoration : Washed Waist Type : high Closure Type : zipper fly Wash : medium Length : full length Material : COTTON Gender : WOMEN Item Type : JEANS Brand Name : BiggOrange Elasticity : Slight Strech',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F9.jpg?alt=media&token=a566f654-2f3f-475c-a52e-16838cc0afa8',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Aoaiiys Jeans ',
      slug: 'product-1',
      description:
          'Season : All season Release Date : Autumn 2024 Thickness : Regular Age : MIDDLE AGE Style : Casual Jeans Style : Wide Leg Pants Fit Type : Regular Fabric Type : Cotton denim Decoration : Pockets Waist Type : HIGH Closure Type : Drawstring Wash : Medium Length : Full Length Material : COTTON,Polyester,Viscose Gender : WOMEN Item Type : JEANS Brand Name : Aoaiiys Elasticity : Non Strech Product Size Size: S, Waist: 60 cm,Hip: 114 cm, Length: 103 cm Size: M, Waist: 64 cm, Hip: 118 cm, Length: 104 c ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F10.jpg?alt=media&token=ddeb6826-8458-4c4b-a6bf-b5a8d8114bfc',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Aoaiiys Jeans ',
      slug: 'product-1',
      description:
          'Season : All season Release Date : Autumn 2024 Thickness : Regular Age : MIDDLE AGE Style : Casual Jeans Style : Wide Leg Pants Fit Type : Regular Fabric Type : Cotton denim Decoration : Pockets Waist Type : HIGH Closure Type : Drawstring Wash : Medium Length : Full Length Material : COTTON,Polyester,Viscose Gender : WOMEN Item Type : JEANS Brand Name : Aoaiiys Elasticity : Non Strech Product Size Size: S, Waist: 60 cm,Hip: 114 cm, Length: 103 cm Size: M, Waist: 64 cm, Hip: 118 cm, Length: 104 c ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F11.jpg?alt=media&token=e858fd20-bd0b-4549-b503-dd000d2c406a',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
    ProductDataEntity(
      sold: 100,
      images: [
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.1.jpg?alt=media&token=902f6372-75aa-4be3-a59f-8bb122b7dbec',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.2.jpg?alt=media&token=3c8f0fc4-1dc0-47f3-a922-462671111b67',
        'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F1%2F1.3.jpg?alt=media&token=bc6dc172-a616-4d95-8474-88a3a62147a1',
      ],
      subcategory: [
        SubcategoryEntity(
          id: '1',
          name: 'Subcategory 1',
          slug: 'subcategory-1',
          category: 'Category 1',
        ),
      ],
      ratingsQuantity: 50,
      id: '1',
      title: 'Aoaiiys Jeans ',
      slug: 'product-1',
      description:
          'Season : All season Release Date : Autumn 2024 Thickness : Regular Age : MIDDLE AGE Style : Casual Jeans Style : Wide Leg Pants Fit Type : Regular Fabric Type : Cotton denim Decoration : Pockets Waist Type : HIGH Closure Type : Drawstring Wash : Medium Length : Full Length Material : COTTON,Polyester,Viscose Gender : WOMEN Item Type : JEANS Brand Name : Aoaiiys Elasticity : Non Strech Product Size Size: S, Waist: 60 cm,Hip: 114 cm, Length: 103 cm Size: M, Waist: 64 cm, Hip: 118 cm, Length: 104 c ',
      quantity: 10,
      price: 300,
      imageCover:
          'https://firebasestorage.googleapis.com/v0/b/la-mode-418300.appspot.com/o/pants%2F12.jpg?alt=media&token=96abacd7-7818-4edb-ba24-d1ba352fe2a5',
      category: CategoryEntity(
        id: '6439d58a0049ad0b52b9003f',
        name: 'Women\'s Fashion',
        slug: 'women\'s-fashion',
        image:
            'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747343/Route-Academy-categories/1681511818071.jpeg',
      ),
      brand: BrandEntity(
        id: '64089bbe24b25627a253158b',
        name: 'DeFacto',
        slug: 'defacto',
        image:
            'https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png',
      ),
      ratingsAverage: 4.5,
      priceAfterDiscount: 280,
    ),
  ];

  String selectedSortOption = 'price';
  List<String> selectedFilterOptions = [];

  onMultiSelectFilterAlert(String string) {
    if (selectedFilterOptions.contains(string)) {
      selectedFilterOptions.remove(string);
    } else {
      selectedFilterOptions.add(string);
    }
    emit(CatCheckBox());
  }

  void onSingleFilterAlertChanged(String? value) {
    selectedSortOption = value.toString();
    emit(CatCheckBox());
  }

  void resetAllCheck() {
    selectedFilterOptions = [];
    selectedSortOption = 'price';
    emit(CatCheckBox());
  }
}
