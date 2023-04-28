import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/repo.dart';

import '../core/errors/failure.dart';

class FetchDrinksUsecase {
  final Repo repository;
  FetchDrinksUsecase(this.repository);

  Future<Either<Failure, List<DrinkEntity>>> call() async {
    return await repository.fetchDrinks();
  }
}
