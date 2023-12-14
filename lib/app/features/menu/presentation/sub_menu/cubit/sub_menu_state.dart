import 'package:equatable/equatable.dart';
import 'package:fineline_coffee/app/features/menu/data/models/sub_menu_model.dart';

abstract class SubMenuState extends Equatable {
  const SubMenuState();
  @override
  List<Object> get props => [];
}

class SubMenuInitial extends SubMenuState {}

class SubMenuLoading extends SubMenuState {}

class SubMenuLoaded extends SubMenuState {
  final List<SubMenuModel> result;
  const SubMenuLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class SubMenuError extends SubMenuState {
  final String message;
  const SubMenuError(this.message);

  @override
  List<Object> get props => [message];
}
