import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/menu_usecase.dart';
import 'menus_state.dart';

class MenusCubit extends Cubit<MenusState> {
  final MenusUsecase _usecase;

  MenusCubit(this._usecase) : super(MenusInitial());

  Future<void> getMenu() async {
    emit(MenusLoading());

    try {
      final result = await _usecase.execute();

      emit(
        result.fold(
          (failure) => MenusError(failure.message),
          (result) => MenusLoaded(result),
        ),
      );
    } catch (e) {
      emit(
        MenusError(e.toString()),
      );
    }
  }
}
