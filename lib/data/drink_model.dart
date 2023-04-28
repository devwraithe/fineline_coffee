import 'package:equatable/equatable.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';

class DrinkModel extends Equatable {
  final String title;
  final double price;
  final String image;
  final int size;
  final int calories;
  final List addons;

  const DrinkModel({
    required this.title,
    required this.price,
    required this.image,
    required this.size,
    required this.calories,
    required this.addons,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      title: json['title'] as String,
      price: json['price'] as double,
      image: json['image'] as String,
      size: json['size'] as int,
      calories: json['calories'] as int,
      addons: json['addons'] as List,
    );
  }

  DrinkEntity toEntity() {
    return DrinkEntity(
      title: title,
      price: price,
      image: image,
      size: size,
      calories: calories,
      addons: addons,
    );
  }

  @override
  List<Object> get props => [title, price, image, size, calories, addons];
}
