part of 'add_company_bloc.dart';

abstract class AddCompanyState extends Equatable {
  const AddCompanyState();
  @override
  List<Object?> get props => [];
}

class AddCompanyInitial extends AddCompanyState {
  const AddCompanyInitial();
}

class AddCompanyLoading extends AddCompanyState {
  const AddCompanyLoading();
}

class AddCompanySuccess extends AddCompanyState {
  const AddCompanySuccess();
}

class AddCompanyFailure extends AddCompanyState {
  final String message;
  const AddCompanyFailure(this.message);
  @override
  List<Object?> get props => [message];
}
