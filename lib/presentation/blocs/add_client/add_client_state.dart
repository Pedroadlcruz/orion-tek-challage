part of 'add_client_bloc.dart';

abstract class AddClientState extends Equatable {
  const AddClientState();
  @override
  List<Object?> get props => [];
}

class AddClientInitial extends AddClientState {
  const AddClientInitial();
}

class AddClientLoading extends AddClientState {
  const AddClientLoading();
}

class AddClientSuccess extends AddClientState {
  final Client client;
  const AddClientSuccess(this.client);
  @override
  List<Object?> get props => [client];
}

class AddClientFailure extends AddClientState {
  final String message;
  const AddClientFailure(this.message);
  @override
  List<Object?> get props => [message];
}
