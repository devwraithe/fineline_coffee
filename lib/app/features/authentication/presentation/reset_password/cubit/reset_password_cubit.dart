import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/reset_password_usecase.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase _usecase;

  ResetPasswordCubit(this._usecase) : super(ResetPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());

    try {
      final result = await _usecase.call(email);

      emit(
        result.fold(
          (failure) => ResetPasswordError(failure.message),
          (_) => ResetPasswordSuccessful(),
        ),
      );
    } catch (e) {
      emit(
        ResetPasswordError(e.toString()),
      );
    }
  }
}
