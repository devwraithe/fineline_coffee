import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/menu_model.dart';
import '../menu_repository.dart';

class MenusUsecase {
  final MenuRepository _repository;
  MenusUsecase(this._repository);

  Future<Either<Failure, List<MenuModel>>> execute() async {
    final result = await _repository.menu();
    return result.fold(
      (failure) => Left(failure),
      (menuList) => Right(menuList),
    );
  }
}
