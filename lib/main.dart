import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_provider.dart';
import 'package:my_ecommerce_app/provider/OnBoardProider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OnBoardProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: const MyApp()));
}
