part of 'client_detail_bloc.dart';

abstract class ClientDetailEvent extends Equatable {
  const ClientDetailEvent();
  @override
  List<Object?> get props => [];
}

class LoadAddresses extends ClientDetailEvent {
  final int clientId;
  const LoadAddresses(this.clientId);

  @override
  List<Object?> get props => [clientId];
}
