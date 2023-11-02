part of 'company_detail_bloc.dart';

abstract class CompanyDetailState extends Equatable {
  const CompanyDetailState();
  @override
  List<Object?> get props => [];
}

class CompanyDetailInitial extends CompanyDetailState {
  const CompanyDetailInitial();
}

class CompanyDetailLoading extends CompanyDetailState {
  const CompanyDetailLoading();
}

class CompanyDetailSuccess extends CompanyDetailState {
  final List<Client> clients;
  const CompanyDetailSuccess(this.clients);
  @override
  List<Object?> get props => [clients];
}

class CompanyDetailFailure extends CompanyDetailState {
  final String message;
  const CompanyDetailFailure(this.message);
  @override
  List<Object?> get props => [message];
}
