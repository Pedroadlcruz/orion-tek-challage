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

class DeleteAddress extends ClientDetailEvent {
  final Address address;
  const DeleteAddress(this.address);

  @override
  List<Object?> get props => [address];
}
