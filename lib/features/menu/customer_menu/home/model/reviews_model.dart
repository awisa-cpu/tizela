// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewsModel {
  final String reviewerName, reviewText;
  final double rating;
  ReviewsModel(
    this.reviewerName, {
    required this.reviewText,
    required this.rating,
  });
}
