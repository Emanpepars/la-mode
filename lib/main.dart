import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/provider/OnBoardProider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OnBoardProvider()),
  ], child: const MyApp()));
}
