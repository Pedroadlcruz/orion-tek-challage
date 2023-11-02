part of 'company_detail_bloc.dart';

abstract class CompanyDetailEvent extends Equatable {
  const CompanyDetailEvent();
  @override
  List<Object?> get props => [];
}

class LoadClients extends CompanyDetailEvent {
  final int companyId;
  const LoadClients(this.companyId);

  @override
  List<Object?> get props => [companyId];
}

class DeleteClient extends CompanyDetailEvent {
  final Client client;
  const DeleteClient(this.client);

  @override
  List<Object?> get props => [client];
}
