import 'package:fineline_coffee/data/data_source.dart';
import 'package:fineline_coffee/data/repo_impl.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/presentation/providers/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecase.dart';

final fetchDrinksRepo = Provider<RepoImpl>((ref) {
  final dataSource = ref.watch(Provider<DataSourceImpl>((ref) {
    return DataSourceImpl(http.Client());
  }));
  return RepoImpl(dataSource);
});

final fetchDrinksUsecase = Provider<FetchDrinksUsecase>((ref) {
  final repository = ref.watch(fetchDrinksRepo);
  return FetchDrinksUsecase(repository);
});

final fetchDrinksProvider =
    StateNotifierProvider.autoDispose<DrinksProvider, List<DrinkEntity>>((ref) {
  final useCase = ref.watch(fetchDrinksUsecase);
  return DrinksProvider(useCase);
});
