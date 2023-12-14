import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
  final String id, name, image;

  const MenuModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MenuModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return MenuModel(
      id: snapshot.id,
      name: data['name'],
      image: data['image'],
    );
  }
  List<Object?> get props => [id, name, image];
}
