import 'package:flutter/material.dart';
import 'package:la_mode/core/utils/app_components.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWithBag(
        appBarTitle: "Track Order",
      ),
    );
  }
}
