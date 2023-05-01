import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrinksProvider extends StateNotifier<List<DrinkEntity>> {
  final HotCoffeesUsecase _hotCoffeesUsecase;
  final ColdCoffeesUsecase _coldCoffeesUsecase;
  final HotTeasUsecase _hotTeasUsecase;
  final ColdTeasUsecase _coldTeasUsecase;

  DrinksProvider(
    this._hotCoffeesUsecase,
    this._coldCoffeesUsecase,
    this._hotTeasUsecase,
    this._coldTeasUsecase,
  ) : super([]) {
    fetchHotCoffees();
    fetchColdCoffees();
    fetchHotTeas();
    fetchColdTeas();
  }

  Future<void> fetchHotCoffees() async {
    final result = await _hotCoffeesUsecase.call();

    result.fold(
      (failure) => print("error fetching drinks"),
      (data) => state = data,
    );
  }

  Future<void> fetchColdCoffees() async {
    final result = await _coldCoffeesUsecase.call();

    result.fold(
      (failure) => print("error fetching cold coffees"),
      (data) => state = data,
    );
  }

  Future<void> fetchHotTeas() async {
    final result = await _hotTeasUsecase.call();

    result.fold(
      (failure) => print("error fetching hot teas"),
      (data) => state = data,
    );
  }

  Future<void> fetchColdTeas() async {
    final result = await _coldTeasUsecase.call();

    result.fold(
      (failure) => print("error fetching cold teas"),
      (data) => state = data,
    );
  }
}
