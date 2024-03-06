import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/reviews/presentation/manager/reviews_state.dart';

import '../../domain/entities/review_entity.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());

  static ReviewsCubit get(context) => BlocProvider.of(context);

  List<ReviewEntity> reviews = [
    ReviewEntity('David Martinez', 5.0, 'Incredible service, exceeded expectations!', 1),
    ReviewEntity('Emily Davis', 5.0, 'Fantastic! Will definitely buy again.', 2),
    ReviewEntity('Jane Smith', 5.0, 'Awesome service, highly recommended!', 3),
    ReviewEntity('Daniel Thomas', 4.0, 'Very happy with my purchase, thank you!', 4),
    ReviewEntity('John Doe', 4.0, 'Great product, very satisfied!', 5),
    ReviewEntity('Michelle Hernandez', 4.0, 'Impressed with the quality, will buy again.', 5),
    ReviewEntity('Kevin Rodriguez', 5.0, 'Amazing product, worth every penny.', 3),
    ReviewEntity('Michael Wilson', 4.0, 'Good quality, fast delivery.', 6),
    ReviewEntity('Alice Johnson', 3.0, 'Good experience overall, but could be improved.', 7),
    ReviewEntity('Amanda Clark', 3.0, 'Decent product, but delivery was slow.', 7),
    ReviewEntity('Sarah Anderson', 3.0, 'Average experience, nothing special.', 8),
    ReviewEntity('Laura Garcia', 3.0, 'Fairly satisfied, but could be better.', 9),
    ReviewEntity('Bob Brown', 2.0, 'Not happy with the product, needs improvement.', 10),
    ReviewEntity('Christopher Moore', 2.0, 'Product did not meet my expectations.', 11),
    ReviewEntity('Jennifer Taylor', 2.0, 'Disappointed with the product, not as described.', 12),
  ];

}
