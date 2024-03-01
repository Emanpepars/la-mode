import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:my_ecommerce_app/provider/OnBoardProider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OnBoardProvider()),
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
    ),
  ], child: const MyApp()));
}
