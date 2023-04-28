import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrinksProvider extends StateNotifier<List<DrinkEntity>> {
  final FetchDrinksUsecase _usecase;
  DrinksProvider(this._usecase) : super([]) {
    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    final result = await _usecase.call();

    result.fold(
      (failure) => print("error fetching drinks"),
      (data) => state = data,
    );
  }
}
