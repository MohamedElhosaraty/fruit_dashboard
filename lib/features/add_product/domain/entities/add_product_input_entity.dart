import 'dart:io';

import 'package:fruit_dashboard/features/add_product/data/models/review_model.dart';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  final String code;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  AddProductInputEntity({
    required this.name,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.sellingCount = 0,
    this.imageUrl,
    required this.isFeatured,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
  });
}
