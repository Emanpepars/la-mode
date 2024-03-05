import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce_app/features/sellers/presentation/manager/sellers_state.dart';

import '../../domain/entities/seller_entity.dart';

class SellersCubit extends Cubit<SellersState> {
  SellersCubit() : super(SellersInitial());

  static SellersCubit get(context) => BlocProvider.of(context);

  List<SellerEntity> sellers = [
    SellerEntity(
      userName: 'John Doe',
      rate: 4.5,
      location: 'New York',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'Jane Smith',
      rate: 4.0,
      location: 'Los Angeles',
      isOpen: false,
    ),
    SellerEntity(
      userName: 'Alice Johnson',
      rate: 4.8,
      location: 'Chicago',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'Michael Brown',
      rate: 4.2,
      location: 'Houston',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'David Wilson',
      rate: 4.7,
      location: 'Phoenix',
      isOpen: false,
    ),
    SellerEntity(
      userName: 'Sarah Martinez',
      rate: 4.3,
      location: 'Philadelphia',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'James Jones',
      rate: 4.6,
      location: 'San Antonio',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'Linda Davis',
      rate: 4.1,
      location: 'San Diego',
      isOpen: false,
    ),
    SellerEntity(
      userName: 'Robert Miller',
      rate: 4.9,
      location: 'Dallas',
      isOpen: true,
    ),
    SellerEntity(
      userName: 'Karen Wilson',
      rate: 4.4,
      location: 'San Jose',
      isOpen: true,
    ),
  ];
}
