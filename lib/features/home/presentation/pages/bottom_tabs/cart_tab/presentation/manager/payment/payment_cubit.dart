import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/payment/payment_state.dart';
import '../../../../../../../../../core/utils/app_constants.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  final Dio dio = Dio(); // Create an instance of Dio

  PaymentCubit() : super(InitPaymentState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  void getAuthToken(
      String email, String phone, String fName, String lName, String amount) {
    emit(LoadingAuthTokenPaymentState());
    dio.post("${AppConstants.basePaymentUrl}${EndPoints.authToken}",
        data: {"api_key": API_KEY}).then((response) {
      var value = response.data;
      AUTH_TOKEN = value["token"];
      print("Route token > $AUTH_TOKEN");
      getOrderID(email, phone, fName, lName, amount);
      emit(SuccessAuthTokenPaymentState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAuthTokenPaymentState());
    });
  }

  void getOrderID(
      String email, String phone, String fName, String lName, String amount) {
    emit(LoadingOrderIdPaymentState());
    dio.post("${AppConstants.basePaymentUrl}${EndPoints.orderId}", data: {
      "auth_token": AUTH_TOKEN,
      "delivery_needed": "false",
      "amount_cents": amount,
      "currency": "EGP",
      "items": []
    }).then((response) {
      var value = response.data;
      ORDER_ID = value["id"].toString();
      getRequestTokenCard(email, phone, fName, lName, amount);
      getRequestTokenKiosk(email, phone, fName, lName, amount);

      emit(SuccessOrderIdPaymentState());
    }).catchError((error) {
      print(error);
      emit(ErrorOrderIdPaymentState());
    });
  }

  void getRequestTokenCard(
      String email, String phone, String fName, String lName, String amount) {
    emit(LoadingRequestTokenCardPaymentState());
    dio.post("${AppConstants.basePaymentUrl}${EndPoints.requestToken}", data: {
      "auth_token": AUTH_TOKEN,
      "amount_cents": amount,
      "expiration": 3600,
      "order_id": ORDER_ID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "EG",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": INTERGRATIONCARDID
    }).then((response) {
      var value = response.data;
      REQUEST_TOKEN_CARD = value["token"];
      emit(SuccessRequestTokenCardPaymentState());
    }).catchError((error) {
      emit(ErrorRequestTokenCardPaymentState());
    });
  }

  void getRequestTokenKiosk(
      String email, String phone, String fName, String lName, String amount) {
    emit(LoadingRequestTokenKioskPaymentState());
    dio.post("${AppConstants.basePaymentUrl}${EndPoints.requestToken}", data: {
      "auth_token": AUTH_TOKEN,
      "amount_cents": amount,
      "expiration": 3600,
      "order_id": ORDER_ID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "EG",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": INTERGRATIONKIOSKID
    }).then((response) {
      var value = response.data;
      REQUEST_TOKEN_KIOSK = value["token"];
      getRefCode();
      emit(SuccessRequestTokenKioskPaymentState());
    }).catchError((error) {
      emit(ErrorRequestTokenKioskPaymentState());
    });
  }

  void getRefCode() {
    emit(LoadingReferenceCodePaymentState());
    dio.post("${AppConstants.basePaymentUrl}${EndPoints.getRefCode}", data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": REQUEST_TOKEN_KIOSK
    }).then((response) {
      var value = response.data;
      REF_CODE = value["id"].toString();
      print(AUTH_TOKEN);
      print(ORDER_ID);
      print(REQUEST_TOKEN_CARD);
      print(REQUEST_TOKEN_KIOSK);
      print(REF_CODE);
      emit(SuccessReferenceCodePaymentState());
    }).catchError((error) {
      emit(ErrorReferenceCodePaymentState());
    });
  }
}
