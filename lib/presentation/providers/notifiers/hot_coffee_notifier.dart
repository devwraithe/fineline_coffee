import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotCoffeesNotifier extends StateNotifier<List<DrinkEntity>> {
  final HotCoffeesUsecase _hotCoffeesUsecase;

  HotCoffeesNotifier(this._hotCoffeesUsecase) : super([]) {
    getHotCoffees();
  }

  Future<void> getHotCoffees() async {
    final result = await _hotCoffeesUsecase.call();
    result.fold(
      (failure) => debugPrint("error fetching drinks"),
      (data) => state = data,
    );
  }
}
