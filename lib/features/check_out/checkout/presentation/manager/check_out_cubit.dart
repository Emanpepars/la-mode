import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  static CheckOutCubit get(context) => BlocProvider.of(context);

  String selectedSortOption = 'Cash on delivery';

  void paymentMethod({String? newValue}) {
    selectedSortOption = newValue.toString();
    emit(UpdateState());
  }

  void paymentMethods(BuildContext context, {String? newValue}) {
    paymentMethod(newValue: newValue);
  }
}
