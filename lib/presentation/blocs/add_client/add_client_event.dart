part of 'add_client_bloc.dart';

abstract class AddClientEvent extends Equatable {
  const AddClientEvent();
  @override
  List<Object?> get props => [];
}

class AddClient extends AddClientEvent {
  final ClientParams clientData;
  const AddClient(this.clientData);

  @override
  List<Object?> get props => [clientData];
}
