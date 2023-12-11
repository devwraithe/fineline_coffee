import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/authentication/data/auth_repository_impl.dart';
import '../../../features/authentication/domain/auth_repository.dart';
import '../../../features/authentication/domain/usecases/login_usecase.dart';
import '../../../features/authentication/domain/usecases/register_usecase.dart';
import '../../../features/authentication/domain/usecases/reset_password_usecase.dart';
import '../../../features/authentication/presentation/login/cubit/login_cubit.dart';
import '../../../features/authentication/presentation/register/cubit/register_cubit.dart';
import '../../../features/authentication/presentation/reset_password/cubit/reset_password_cubit.dart';
import '../services/di_service.dart';

void registerInjector() {
  regSingleton(() => RegisterCubit(sl()));
  regSingleton(() => RegisterUsecase(sl()));
}

void loginInjector() {
  regSingleton(() => LoginCubit(sl()));
  regSingleton(() => LoginUsecase(sl()));
}

void resetPasswordInjector() {
  regSingleton(() => ResetPasswordCubit(sl()));
  regSingleton(() => ResetPasswordUsecase(sl()));
}

// feature injector
void authInjector() {
  regSingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  regSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
