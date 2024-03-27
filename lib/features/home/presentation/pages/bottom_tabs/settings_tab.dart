import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/widgets/settings_row.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsRow(
                title: 'Language',
                isDes: true,
                des: 'Change application language',
              ),
              const SettingsRow(
                title: 'Account Settings',
                isDes: true,
                des: 'Personal information',
              ),
              const SettingsRow(
                title: 'Appearance',
                isDes: true,
                des: 'Dark and light mode, font size, eye comfort settings',
              ),
              const SettingsRow(
                title: 'Security',
              ),
              const SettingsRow(
                title: 'Privacy and policy',
              ),
              const SettingsRow(
                title: 'Terms and conditions',
              ),
              const SettingsRow(
                title: 'Help & FAG',
              ),
              const SettingsRow(
                title: 'Contact us',
              ),
              const SettingsRow(
                title: 'About us',
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        userName: userEntity.name,
        userEmail: userEntity.email,
      ),
    );
  }
}
