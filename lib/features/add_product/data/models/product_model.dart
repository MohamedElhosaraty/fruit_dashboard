import 'dart:io';

import 'package:fruit_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
        required this.code,
        required this.description,
        required this.expirationsMonths,
        required this.numberOfCalories,
        required this.unitAmount,
        required this.reviews,
        required this.price,
        this.sellingCount = 0,
        required this.isOrganic,
        required this.image,
        required this.isFeatured,
        this.imageUrl});

  //  تحويل ال Entity to Model
  factory ProductModel.fromEntity(AddProductInputEntity addProductInputEntity) {
    return ProductModel(
         reviews: addProductInputEntity.reviews
            .map((e) => ReviewModel.fromEntity(e))
            .toList(),
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        isOrganic: addProductInputEntity.isOrganic,
        image: addProductInputEntity.image,
        expirationsMonths: addProductInputEntity.expirationsMonths,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        unitAmount: addProductInputEntity.unitAmount,
        isFeatured: addProductInputEntity.isFeatured,
        imageUrl: addProductInputEntity.imageUrl);
  }


  // تستخدم عشان اتعامل مع ال API OR Firebase
  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
       'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }
}