import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColdTeasNotifier extends StateNotifier<List<DrinkEntity>> {
  final ColdTeasUsecase _coldTeasUsecase;

  ColdTeasNotifier(this._coldTeasUsecase) : super([]) {
    getColdTeas();
  }

  Future<void> getColdTeas() async {
    final result = await _coldTeasUsecase.call();
    result.fold(
      (failure) => debugPrint("error fetching drinks"),
      (data) => state = data,
    );
  }
}
