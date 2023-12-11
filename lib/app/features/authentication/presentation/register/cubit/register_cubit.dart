import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/register_usecase.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _usecase;

  RegisterCubit(this._usecase) : super(RegisterInitial());

  Future<void> register(Map<String, dynamic> data) async {
    emit(RegisterLoading());

    try {
      final result = await _usecase.call(data);

      emit(
        result.fold(
          (failure) => RegisterError(failure.message),
          (result) => RegisterSuccessful(result),
        ),
      );
    } catch (e) {
      emit(
        RegisterError(e.toString()),
      );
    }
  }
}
