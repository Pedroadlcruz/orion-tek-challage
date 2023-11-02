part of 'add_address_bloc.dart';

abstract class AddAddressState extends Equatable {
  const AddAddressState();
  @override
  List<Object?> get props => [];
}

class AddAddressInitial extends AddAddressState {
  const AddAddressInitial();
}

class AddClientLoading extends AddAddressState {
  const AddClientLoading();
}

class AddClientSuccess extends AddAddressState {
  const AddClientSuccess();
}

class AddClientFailure extends AddAddressState {
  final String message;
  const AddClientFailure(this.message);
  @override
  List<Object?> get props => [message];
}
