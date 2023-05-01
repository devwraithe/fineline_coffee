import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColdCoffeesNotifier extends StateNotifier<List<DrinkEntity>> {
  final ColdCoffeesUsecase _coldCoffeesUsecase;

  ColdCoffeesNotifier(this._coldCoffeesUsecase) : super([]) {
    getColdCoffees();
  }

  Future<void> getColdCoffees() async {
    final result = await _coldCoffeesUsecase.call();
    result.fold(
      (failure) => debugPrint("error fetching drinks"),
      (data) => state = data,
    );
  }
}
