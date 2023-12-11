import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository _repo;
  ResetPasswordUsecase(this._repo);

  Future<Either<Failure, void>> call(String email) async {
    final response = await _repo.resetPassword(email);
    return response.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }
}
