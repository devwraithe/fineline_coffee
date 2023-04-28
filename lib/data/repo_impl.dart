import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/domain/drink_entity.dart';

import '../core/errors/exception.dart';
import '../core/errors/failure.dart';
import '../domain/repo.dart';
import 'data_source.dart';

class RepoImpl implements Repo {
  final DataSource dataSource;
  RepoImpl(this.dataSource);

  @override
  Future<Either<Failure, List<DrinkEntity>>> fetchDrinks() async {
    try {
      final result = await dataSource.fetchDrinks();
      return Right(result.map((drink) => drink.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("error fetching drinks"));
    }
  }
}
