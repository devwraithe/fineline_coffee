import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../auth_repository.dart';

class LoginUsecase {
  final AuthRepository _repo;
  LoginUsecase(this._repo);

  Future<Either<Failure, void>> call(Map<String, dynamic> data) async {
    final response = await _repo.login(data);
    return response.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }
}
