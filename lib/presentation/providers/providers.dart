import 'package:fineline_coffee/data/data_source.dart';
import 'package:fineline_coffee/data/repo_impl.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/presentation/providers/notifiers/hot_coffee_notifier.dart';
import 'package:fineline_coffee/presentation/providers/notifiers/hot_teas_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecase.dart';
import 'notifiers/cold_coffees_notifier.dart';
import 'notifiers/cold_teas_notifier.dart';

final drinksRepo = Provider<RepoImpl>((ref) {
  final dataSource = ref.watch(Provider<DataSourceImpl>((ref) {
    return DataSourceImpl(http.Client());
  }));
  return RepoImpl(dataSource);
});

// usecases
final hotCoffeesUsecase = Provider<HotCoffeesUsecase>((ref) {
  final repository = ref.watch(drinksRepo);
  return HotCoffeesUsecase(repository);
});

final coldCoffeesUsecase = Provider<ColdCoffeesUsecase>((ref) {
  final repository = ref.watch(drinksRepo);
  return ColdCoffeesUsecase(repository);
});

final hotTeasUsecase = Provider<HotTeasUsecase>((ref) {
  final repository = ref.watch(drinksRepo);
  return HotTeasUsecase(repository);
});

final coldTeasUsecase = Provider<ColdTeasUsecase>((ref) {
  final repository = ref.watch(drinksRepo);
  return ColdTeasUsecase(repository);
});

// notifiers
final hotCoffeesProvider =
    StateNotifierProvider.autoDispose<HotCoffeesNotifier, List<DrinkEntity>>(
        (ref) => HotCoffeesNotifier(ref.watch(hotCoffeesUsecase)));
final coldCoffeesProvider =
    StateNotifierProvider.autoDispose<ColdCoffeesNotifier, List<DrinkEntity>>(
        (ref) => ColdCoffeesNotifier(ref.watch(coldCoffeesUsecase)));
final hotTeasProvider =
    StateNotifierProvider.autoDispose<HotTeasNotifier, List<DrinkEntity>>(
        (ref) => HotTeasNotifier(ref.watch(hotTeasUsecase)));
final coldTeasProvider =
    StateNotifierProvider.autoDispose<ColdTeasNotifier, List<DrinkEntity>>(
        (ref) => ColdTeasNotifier(ref.watch(coldTeasUsecase)));
