import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class Model3d extends StatelessWidget {
  final String productName;
  final String productModelPath;

  const Model3d(
      {super.key,
      required this.productName,
      this.productModelPath = 'assets/3d/sport_sneakers_3d_model.glb'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        productName,
        style: roboto20(
          weight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : Colors.white,
        ),
      )),
      body: ModelViewer(
        backgroundColor: Colors.transparent,
        src: productModelPath,
        alt: 'A 3D model of an $productName',
        ar: true,
        autoRotate: true,
        iosSrc: productModelPath,
        disableZoom: true,
      ),
    );
  }
}
