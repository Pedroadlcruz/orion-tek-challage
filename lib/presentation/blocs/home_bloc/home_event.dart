part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadCompanies extends HomeEvent {
  const LoadCompanies();

  @override
  List<Object?> get props => [];
}

class DeleteCompany extends HomeEvent {
  final int id;
  const DeleteCompany(this.id);

  @override
  List<Object?> get props => [id];
}
