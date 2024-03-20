import 'package:flutter/material.dart';
import 'package:la_mode/features/register/domain/entities/user_entity.dart';

import '../../../../../core/utils/app_components.dart';

class SettingsTab extends StatelessWidget {
  final UserEntity userEntity;

  const SettingsTab({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConstAppBar(
        title: 'Settings',
      ),
      drawer: MyDrawer(
        userName: userEntity.name,
        userEmail: userEntity.email,
      ),
    );
  }
}
