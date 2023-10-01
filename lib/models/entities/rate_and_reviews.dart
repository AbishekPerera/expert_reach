class RateAndReviews {
  String id;
  String user_id;
  String service_id;
  String feedback;
  String stars;
  String created_at;
  String updated_at;

  RateAndReviews({
    required this.id,
    required this.user_id,
    required this.service_id,
    required this.feedback,
    required this.stars,
    required this.created_at,
    required this.updated_at,
  });

  factory RateAndReviews.fromJson(Map<String, dynamic> json) => RateAndReviews(
        id: json["rate_and_reviews_id"] ?? "",
        user_id: json["rate_and_reviews_user_id"] ?? "",
        service_id: json["rate_and_reviews_service_id"] ?? "",
        feedback: json["rate_and_reviews_feedback"] ?? "",
        stars: json["rate_and_reviews_stars"] ?? "",
        created_at: json["rate_and_reviews_created_at"] ?? "",
        updated_at: json["rate_and_reviews_updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "rate_and_reviews_id": id,
        "rate_and_reviews_user_id": user_id,
        "rate_and_reviews_service_id": service_id,
        "rate_and_reviews_feedback": feedback,
        "rate_and_reviews_stars": stars,
        "rate_and_reviews_created_at": created_at,
        "rate_and_reviews_updated_at": updated_at,
      };
}
