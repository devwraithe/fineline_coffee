import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotTeasNotifier extends StateNotifier<List<DrinkEntity>> {
  final HotTeasUsecase _hotTeasUsecase;

  HotTeasNotifier(this._hotTeasUsecase) : super([]) {
    getHotTeas();
  }

  Future<void> getHotTeas() async {
    final result = await _hotTeasUsecase.call();
    result.fold(
      (failure) => debugPrint("error fetching drinks"),
      (data) => state = data,
    );
  }
}
