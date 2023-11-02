part of 'add_company_bloc.dart';

abstract class AddCompanyEvent extends Equatable {
  const AddCompanyEvent();
  @override
  List<Object?> get props => [];
}

class AddCompany extends AddCompanyEvent {
  final String name;
  const AddCompany(this.name);

  @override
  List<Object?> get props => [name];
}
