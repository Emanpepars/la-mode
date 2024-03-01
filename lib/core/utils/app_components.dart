import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';

import '../../features/home/presentation/widgets/my_yellow_button.dart';
import 'app_colors.dart';
import 'app_icons.dart';

class AppComponents {
  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "data",
        ),
      ),
    );
  }

  static Widget onboardImage({required String onboardImg, bool skip = true}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardImg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken, // You can adjust the blend mode
          ),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 25.w),
      child: Text(
        skip ? "Skip" : "",
        style: roboto16W400(color: Colors.white),
        textAlign: TextAlign.right,
      ),
    );
  }

  static Widget myButton(Color? color, TextStyle? style, text) {
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
        ),
        child: Text(
          text,
          style: style ?? roboto18W500(color: Colors.white),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Color color;
  final TextStyle? style;
  final String text;
  final Color? textColor;
  final Function()? onPressed;

  const MyButton(
      {required this.text,
      this.color = AppColors.primary,
      this.style,
      this.textColor = Colors.white,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.sp)),
          ),
        ),
        child: Text(
          text,
          style: roboto18W500(color: textColor),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: const AssetImage(
                    AppImages.onboard1,
                  ),
                  width: 200.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.lightGray,
                    child: Image(
                      image: const AssetImage(
                        AppIcons.heart,
                      ),
                      color: AppColors.primary,
                      width: 15.w,
                      height: 15.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shirt blouse",
                    style: roboto14(weight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.gold,
                      ),
                      Text(
                        "4.5",
                        style: roboto12W400().copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.silverDark),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    "\$39",
                    style: roboto18W500().copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 5.w),
                  const Text(""),
                ],
              ),
            ],
          ),
          MyYellowButton(text: "Add To Cart", onPressed: () {}),
        ],
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String text;
  final String image;

  const CollectionCard({required this.text, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(21),
        ),
        border: Border.all(
          color: AppColors.silverM,
        ),
      ),
      child: Container(
        height: 150.h,
        width: 200.w,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                  AppColors.silverDark, BlendMode.multiply),
              image: AssetImage(image),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: roboto16W500(color: Colors.white),
        )),
      ),
    );
  }
}

class ShopBy extends StatelessWidget {
  final String shopBy;

  const ShopBy({required this.shopBy, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 20.w),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGray, elevation: 0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shopBy,
                  style: roboto14(weight: FontWeight.w500),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
