import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:la_mode/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:la_mode/features/edit_profile/presentation/manager/edit_profile_state.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../auth/register/presentation/widgets/cu_text_form_field.dart';
import '../widgets/city_drop_down.dart';

class EditProfileScreen extends StatelessWidget {
  final UserEntity userEntity;

  const EditProfileScreen({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(userEntity: userEntity),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (BuildContext context, EditProfileState state) => Scaffold(
          appBar: const AppBarWithBag(
            appBarTitle: 'Edit Profile',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Form(
                key: EditProfileCubit.get(context).editProfileFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        EditProfileCubit.get(context).profilePic == null
                            ? CircleAvatar(
                                radius: 35.sp,
                                backgroundImage:
                                    const AssetImage(AppImages.fakeSeller),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.gold,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        35.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(
                                  File(
                                    EditProfileCubit.get(context)
                                        .profilePic!
                                        .path,
                                  ),
                                ),
                                radius: 35.sp,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.gold,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        40.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              if (value != null) {
                                EditProfileCubit.get(context)
                                    .uploadProfilePic(value);
                              }
                            });
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.silverDark,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Upload new photo",
                                style: roboto16W400(
                                  color: AppColors.silverDark,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    ///--- name ---///

                    const CategoryName(title: 'Name'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CuTextFormField(
                      validator: (value) =>
                          EditProfileCubit.get(context).validateName(value),
                      controller:
                          EditProfileCubit.get(context).usernameController,
                      hintText: 'Enter your username',
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: AppColors.silverDark,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///--- email ---///
                    const CategoryName(title: 'Email'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CuTextFormField(
                      validator: (value) =>
                          EditProfileCubit.get(context).validateEmail(value),
                      controller: EditProfileCubit.get(context).emailController,
                      hintText: 'Enter your username',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.silverDark,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///--- Phone Number ---///
                    const CategoryName(title: 'Phone Number'),
                    SizedBox(
                      height: 2.h,
                    ),
                    IntlPhoneField(
                      controller: EditProfileCubit.get(context).phoneController,
                      decoration: InputDecoration(
                        iconColor: AppColors.silverDark,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                        hintText: 'Enter your phone number',
                        hintStyle: robotoTitleField()
                            .copyWith(color: AppColors.silverDark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0.sp),
                          borderSide: BorderSide(
                            color: AppColors.silverM,
                            width: 1.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0.sp),
                          borderSide: const BorderSide(
                            color: AppColors.silverM,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0.sp),
                          borderSide: const BorderSide(
                            color: AppColors.silverM,
                            width: 1.0,
                          ),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {},
                    ),

                    ///--- Location ---///
                    const CategoryName(title: 'Location'),
                    SizedBox(
                      height: 2.h,
                    ),
                    CityDropdown(
                      items: EditProfileCubit.get(context)
                          .cities
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: roboto14(weight: FontWeight.w600),
                                ),
                              ))
                          .toList(),
                      value: EditProfileCubit.get(context).selectedCity,
                      onChange: (value) {
                        EditProfileCubit.get(context).dropDownOnChange(value!);
                      },
                      onMenuStateChange: (isOpen) {
                        EditProfileCubit.get(context)
                            .onMenuStateChange(isOpen, context);
                      },
                      controller:
                          EditProfileCubit.get(context).locationController,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    ///--- button ---///
                    SizedBox(
                      height: 45.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              child: MyButton(
                                onPressed: () {
                                  EditProfileCubit.get(context)
                                      .resetAllOnPressed();
                                },
                                text: 'Reset All',
                                color: Colors.white,
                                textColor: AppColors.lightColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              child: MyButton(
                                text: 'Save Changes',
                                onPressed: () {
                                  EditProfileCubit.get(context)
                                      .saveChangeOnPressed(
                                    context,
                                    Text(
                                      'Processing Data',
                                      style: roboto16(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          drawer: MyDrawer(
            userName: userEntity.name,
            userEmail: userEntity.email,
          ),
        ),
      ),
    );
  }
}
