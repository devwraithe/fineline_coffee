import '../auth_repository.dart';

class LogoutUsecase {
  final AuthRepository _repo;
  LogoutUsecase(this._repo);

  Future<void> call() async {
    return await _repo.logout();
  }
}
