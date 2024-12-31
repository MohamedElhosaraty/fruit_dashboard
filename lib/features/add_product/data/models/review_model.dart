class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String data;
  final String reviewDescription;

  ReviewModel(
      {required this.name,
        required this.image,
        required this.rating,
        required this.data,
        required this.reviewDescription});

  factory ReviewModel.fromEntity(ReviewModel reviewModel) {
    return ReviewModel(
        name: reviewModel.name,
        image: reviewModel.image,
        rating: reviewModel.rating,
        data: reviewModel.data,
        reviewDescription: reviewModel.reviewDescription);
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        rating: json['rating'],
        data: json['data'],
        reviewDescription: json['reviewDescription']);
  }


  toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'data': data,
      'reviewDescription': reviewDescription,
    };
  }


}
