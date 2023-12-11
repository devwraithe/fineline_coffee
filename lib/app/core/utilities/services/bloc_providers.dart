import 'package:fineline_coffee/app/features/authentication/presentation/reset_password/cubit/reset_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/authentication/presentation/login/cubit/login_cubit.dart';
import '../../../features/authentication/presentation/register/cubit/register_cubit.dart';
import 'di_service.dart';

blocProviders() {
  return [
    BlocProvider(create: (_) => sl<RegisterCubit>()),
    BlocProvider(create: (_) => sl<LoginCubit>()),
    BlocProvider(create: (_) => sl<ResetPasswordCubit>())
  ];
}
