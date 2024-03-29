import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'package:la_mode/features/auth/login/data/repositories/login_data_repo.dart';
import 'package:la_mode/features/auth/login/domain/repositories/login_domain_repo.dart';
import 'package:la_mode/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_data.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../data/data_sources/login_data_sources.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
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

  login() async {
    emit(LoginLoading());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);

    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);

    var result = await loginUseCase.login(
      UserData(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((l) {
      emit(LoginError(l));
    }, (r) async {
      CacheHelper.saveData(key: 'token', value: r.token);
      var userBox = Hive.box(AppConstants.kUSerBox);
      await userBox.add(r.user);
      emit(
        LoginSuccess(r),
      );
    });
  }

  void loginUpOnPressed(BuildContext context, Widget content) {
    if (LoginCubit.get(context).loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: content,
        ),
      );
      login();
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(LoginUpdateState());
    }
  }
}
