import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/sub_menu_usecase.dart';
import 'sub_menu_state.dart';

class SubMenuCubit extends Cubit<SubMenuState> {
  final SubMenuUsecase _usecase;

  SubMenuCubit(this._usecase) : super(SubMenuInitial());

  Future<void> getSubMenu(String id) async {
    emit(SubMenuLoading());

    try {
      final result = await _usecase.execute(id);

      emit(
        result.fold(
          (failure) => SubMenuError(failure.message),
          (result) => SubMenuLoaded(result),
        ),
      );
    } catch (e) {
      emit(
        SubMenuError(e.toString()),
      );
    }
  }
}
