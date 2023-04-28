import 'package:equatable/equatable.dart';

class DrinkEntity extends Equatable {
  final String title;
  final double price;
  final String image;
  final int size;
  final int calories;
  final List addons;

  const DrinkEntity({
    required this.title,
    required this.price,
    required this.image,
    required this.size,
    required this.calories,
    required this.addons,
  });

  @override
  List<Object> get props => [title, price, image, size, calories, addons];
}
