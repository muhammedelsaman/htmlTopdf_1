import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  factory ProductModel.fromMap(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toMap() => _$ProductModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
