import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  static CheckOutCubit get(context) => BlocProvider.of(context);

  String selectedPaymentOption = 'Cash on delivery';

  void paymentMethods({String? newValue}) {
    selectedPaymentOption = newValue.toString();
    newValue == "Visa"
        ? emit(VisaState())
        : newValue == "Fawry"
            ? emit(FawryState())
            : emit(CashState());
  }

  String selectedAddressOption = 'Home';

  void address({String? newValue}) {
    selectedAddressOption = newValue.toString();
    emit(AddressState());
  }
}
