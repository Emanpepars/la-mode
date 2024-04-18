import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/widgets/settings_row.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import '../../../../../core/utils/app_components.dart';
import '../../widgets/settings_alert_row.dart';

class SettingsTab extends StatelessWidget {
  final UserEntity userEntity;

  const SettingsTab({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstAppBar(
        title: 'Settings'.tr(),
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              25.sp,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SettingsAlertRow(
                              title: 'English',
                              value: 'English',
                              groupValue:
                                  HomeCubit.get(context).selectedLanguageOption,
                              address: (String? newValue) =>
                                  HomeCubit.get(context)
                                      .language(newValue: newValue),
                            ),
                            SettingsAlertRow(
                              title: 'Arabic',
                              value: 'Arabic',
                              groupValue:
                                  HomeCubit.get(context).selectedLanguageOption,
                              address: (String? newValue) =>
                                  HomeCubit.get(context).language(
                                newValue: newValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: SettingsRow(
                  title: 'Language'.tr(),
                  isDes: true,
                  des: 'Change application language'.tr(),
                ),
              ),
              SettingsRow(
                title: 'Account Settings'.tr(),
                isDes: true,
                des: 'Personal information'.tr(),
              ),
              SettingsRow(
                title: 'Appearance'.tr(),
                isDes: true,
                des:
                    'Dark and light mode, font size, eye comfort settings'.tr(),
              ),
              SettingsRow(
                title: 'Security'.tr(),
              ),
              SettingsRow(
                title: 'Privacy and policy'.tr(),
              ),
              SettingsRow(
                title: 'Terms and conditions'.tr(),
              ),
              SettingsRow(
                title: 'Help & FAG'.tr(),
              ),
              SettingsRow(
                title: 'Contact us'.tr(),
              ),
              SettingsRow(
                title: 'About us'.tr(),
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
