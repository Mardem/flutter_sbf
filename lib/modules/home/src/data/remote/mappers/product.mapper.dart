import 'dart:convert';

List<ProductMapper> productMapperFromJson(dynamic str) => List<ProductMapper>.from(
      jsonDecode(jsonEncode(str)).map(
        (dynamic x) => ProductMapper.fromJson(
          x as Map<String, dynamic>,
        ),
      ) as Iterable<dynamic>,
    );

class ProductMapper {
  ProductMapper({
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.rate,
    required this.reviews,
    required this.freeShipping,
    required this.discount,
    required this.id,
    required this.colors,
  });

  factory ProductMapper.fromJson(Map<String, dynamic> json) => ProductMapper(
        name: json['name'] as String,
        image: json['image'] as String,
        price: json['price'] as double,
        oldPrice: json['oldPrice'] as double,
        rate: json['rate'] as int,
        reviews: json['reviews'] as int,
        freeShipping: json['freeShipping'] as bool,
        discount: json['discount'] as int,
        id: json['id'] as String,
        colors: json['colors'] as int,
      );

  final String name;
  final String image;
  final double price;
  final double oldPrice;
  final int rate;
  final int reviews;
  final bool freeShipping;
  final int discount;
  final String id;
  final int colors;
}
