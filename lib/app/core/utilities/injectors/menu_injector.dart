import '../../../features/menu/data/menu_repository_impl.dart';
import '../../../features/menu/domain/menu_repository.dart';
import '../../../features/menu/domain/usecases/menu_usecase.dart';
import '../../../features/menu/domain/usecases/sub_menu_usecase.dart';
import '../../../features/menu/presentation/cubits/menus_cubit.dart';
import '../../../features/menu/presentation/sub_menu/cubit/sub_menu_cubit.dart';
import '../services/di_service.dart';

void menusInjector() {
  regSingleton(() => MenusCubit(sl()));
  regSingleton(() => MenusUsecase(sl()));
}

void subMenuInjector() {
  regSingleton(() => SubMenuCubit(sl()));
  regSingleton(() => SubMenuUsecase(sl()));
}

// feature injector
void menuInjector() {
  regSingleton<MenuRepository>(() => MenuRepositoryImpl());
}
