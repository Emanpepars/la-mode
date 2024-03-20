import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/cache_helper.dart';
import 'package:la_mode/features/register/data/data_sources/register_data_source.dart';
import 'package:la_mode/features/register/data/repositories/register_data_repo.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';
import 'package:la_mode/features/register/domain/repositories/register_domain_repo.dart';
import 'package:la_mode/features/register/domain/use_cases/register_use_case.dart';
import 'package:la_mode/features/register/presentation/manager/register_state.dart';

import '../../../../core/utils/app_constants.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterDto sources;

  RegisterCubit(this.sources) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();

  TextEditingController confirmPasswordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void register() async {
    emit(RegisterLoading());

    RegisterDomainRepo registerDomainRepo =
        RegisterDataRepo(registerDto: sources);
    RegisterUseCase registerUseCase =
        RegisterUseCase(registerDomainRepo: registerDomainRepo);

    var result = await registerUseCase.call(
      UserData(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    result.fold((l) {
      emit(RegisterError(failures: l));
    }, (r) async {
      CacheHelper.saveData(key: 'token', value: r.token);
      var userBox = Hive.box(AppConstants.kUSerBox);
      await userBox.add(r.user);
      emit(RegisterSuccess(r));
    });
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
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

  void signUpOnPressed(BuildContext context, Widget content) {
    if (registerFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: content,
        ),
      );
      register();
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(RegisterUpdateState());
    }
  }
}
