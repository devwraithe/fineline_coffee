import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/app/features/menu/data/models/sub_menu_model.dart';

import '../../../../../core/errors/failure.dart';
import '../menu_repository.dart';

class SubMenuUsecase {
  final MenuRepository _repository;
  SubMenuUsecase(this._repository);

  Future<Either<Failure, List<SubMenuModel>>> execute(String id) async {
    final result = await _repository.subMenu(id);
    return result.fold(
      (failure) => Left(failure),
      (submenu) => Right(submenu),
    );
  }
}
