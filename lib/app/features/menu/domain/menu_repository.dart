import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../data/menu_model.dart';
import '../data/models/sub_menu_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuModel>>> menu();
  Future<Either<Failure, List<SubMenuModel>>> subMenu(String id);
}
