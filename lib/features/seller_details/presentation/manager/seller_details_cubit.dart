import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/seller_details/presentation/manager/seller_details_states.dart';

class SellerDetailsCubit extends Cubit<SellerDetailsStates> {
  SellerDetailsCubit() : super(SellerDetailsInitState());

  static SellerDetailsCubit get(context) => BlocProvider.of(context);
  List<String> brands = [
    "H&M",
    "Adidas",
    "Louis Vuitton",
    "Ralph Lauren",
    "Prada",
    "Versace",
    "Nike",
    "Gucci"
  ];
}
