import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/login/data/repositories/login_data_repo.dart';
import 'package:la_mode/features/login/domain/repositories/login_domain_repo.dart';
import 'package:la_mode/features/login/domain/use_cases/login_use_case.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';

import '../../data/data_sources/login_data_sources.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);

    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);

    var result = await loginUseCase.login(
      UserData(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    print(result);
    result.fold(
      (l) => emit(LoginError(l)),
      (r) => emit(
        LoginSuccess(r),
      ),
    );
  }
}
