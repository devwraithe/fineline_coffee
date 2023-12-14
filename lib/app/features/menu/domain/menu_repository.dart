import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../data/menu_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuModel>>> menu();
}
