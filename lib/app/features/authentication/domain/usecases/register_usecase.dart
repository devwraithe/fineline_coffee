import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failure.dart';
import '../auth_repository.dart';

class RegisterUsecase {
  final AuthRepository _repo;
  RegisterUsecase(this._repo);

  Future<Either<Failure, User?>> call(Map<String, dynamic> data) async {
    final response = await _repo.register(data);
    return response.fold(
      (failure) => Left(failure),
      (result) => Right(result),
    );
  }
}
