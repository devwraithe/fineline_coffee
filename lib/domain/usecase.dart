import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';
import 'package:fineline_coffee/domain/repo.dart';

import '../core/errors/failure.dart';

class HotCoffeesUsecase {
  final Repo repository;
  HotCoffeesUsecase(this.repository);

  Future<Either<Failure, List<DrinkEntity>>> call() async {
    return await repository.hotCoffees();
  }
}

class ColdCoffeesUsecase {
  final Repo repository;
  ColdCoffeesUsecase(this.repository);

  Future<Either<Failure, List<DrinkEntity>>> call() async {
    return await repository.coldCoffees();
  }
}

class HotTeasUsecase {
  final Repo repository;
  HotTeasUsecase(this.repository);

  Future<Either<Failure, List<DrinkEntity>>> call() async {
    return await repository.hotTeas();
  }
}

class ColdTeasUsecase {
  final Repo repository;
  ColdTeasUsecase(this.repository);

  Future<Either<Failure, List<DrinkEntity>>> call() async {
    return await repository.coldTeas();
  }
}
