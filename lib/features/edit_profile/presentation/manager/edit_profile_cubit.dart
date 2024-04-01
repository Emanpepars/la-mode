import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import 'edit_profile_state.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserEntity userEntity;

  EditProfileCubit({required this.userEntity}) : super(EditProfileInitial()) {
    usernameController.text = userEntity.name;
    emailController.text = userEntity.email;
  }

  static EditProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final editProfileFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  XFile? profilePic;

  List<String> cities = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Shubra El-Kheima',
    'Port Said',
    'Suez',
    'Luxor',
    'Mansoura',
    'El-Mahalla El-Kubra',
    'Tanta',
    'Asyut',
    'Ismailia',
    'Fayyum',
    'Zagazig',
    'Aswan',
    'Damietta',
    'Damanhur',
    'Minya',
    'Beni Suef',
    'Hurghada'
  ];

  String selectedCity = 'Cairo';

  ///--- uploadProfilePic  ---///
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePicState());
  }


  // ApiKey.profilePic: await uploadImageToAPI(profilePic!)
  Future uploadImageToAPI(XFile image) async {
    return MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void saveChangeOnPressed(BuildContext context, Widget content) {
    if (editProfileFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: content,
        ),
      );
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(ProfileUpdateState());
    }
  }

  void resetAllOnPressed() {
    usernameController.text = userEntity.name;
    emailController.text = userEntity.email;
    phoneController = TextEditingController();
    emit(ProfileUpdateState());
  }

  dropDownOnChange(String value) {
    selectedCity = value;
    emit(ProfileUpdateState());
  }

  void onMenuStateChange(bool isOpen, BuildContext context) {
    if (!isOpen) {
      EditProfileCubit.get(context).locationController.clear();
    }
    emit(ProfileUpdateState());
  }
}
