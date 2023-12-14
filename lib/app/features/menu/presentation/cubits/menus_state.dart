import 'package:equatable/equatable.dart';
import 'package:fineline_coffee/app/features/menu/data/menu_model.dart';

abstract class MenusState extends Equatable {
  const MenusState();
  @override
  List<Object> get props => [];
}

class MenusInitial extends MenusState {}

class MenusLoading extends MenusState {}

class MenusLoaded extends MenusState {
  final List<MenuModel> result;
  const MenusLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class MenusError extends MenusState {
  final String message;
  const MenusError(this.message);

  @override
  List<Object> get props => [message];
}
