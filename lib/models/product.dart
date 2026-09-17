import 'package:flutter/foundation.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.description = '',
    this.weight,
  });

  final String id;
  final String name;
  final String image; // asset path
  final double price;
  final String description;
  final String? weight;

  String get priceLabel => '\$${price.toStringAsFixed(2)}';
}

@immutable
class AddOn {
  const AddOn({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  final String id;
  final String name;
  final String image;
  final double price;

  String get priceLabel => '\$${price.toStringAsFixed(2)}';
}
