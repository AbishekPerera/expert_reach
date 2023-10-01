import 'package:expert_reach/models/entities/rate_and_reviews.dart';
import 'package:expert_reach/models/entities/users.dart';

class RateAndReviewsWithUsers {
  RateAndReviews rateAndReviews;
  Users users;

  RateAndReviewsWithUsers({
    required this.rateAndReviews,
    required this.users,
  });

  factory RateAndReviewsWithUsers.fromJson(Map<String, dynamic> json) {
    return RateAndReviewsWithUsers(
      rateAndReviews: RateAndReviews.fromJson(json),
      users: Users.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() => {
        ...rateAndReviews.toJson(),
        ...users.toJson(),
      };
}
