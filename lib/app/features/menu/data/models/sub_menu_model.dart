import 'package:cloud_firestore/cloud_firestore.dart';

class SubMenuModel {
  final String id, name, image;
  final num price;

  const SubMenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory SubMenuModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return SubMenuModel(
      id: snapshot.id,
      name: data['name'],
      price: data['price'],
      image: data['image'],
    );
  }
  List<Object?> get props => [id, name, price, image];
}
