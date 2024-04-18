import 'package:la_mode/core/error/failure.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeOnPageChangedState extends HomeState {}

class HomeSelectLanguageState extends HomeState {}

class HomeSelectThemeState extends HomeState {}

class HomeOnTabChangedState extends HomeState {}

class GetAllProductLoading extends HomeState {}

class GetAllProductSuccess extends HomeState {}

class GetAllProductError extends HomeState {
  Failures failures;

  GetAllProductError(this.failures);
}
