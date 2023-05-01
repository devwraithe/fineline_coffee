import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';

import '../core/errors/failure.dart';

abstract class Repo {
  Future<Either<Failure, List<DrinkEntity>>> hotCoffees();
  Future<Either<Failure, List<DrinkEntity>>> coldCoffees();
  Future<Either<Failure, List<DrinkEntity>>> hotTeas();
  Future<Either<Failure, List<DrinkEntity>>> coldTeas();
}
