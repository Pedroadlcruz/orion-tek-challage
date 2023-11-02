part of 'add_address_bloc.dart';

abstract class AddAddressState extends Equatable {
  const AddAddressState();
  @override
  List<Object?> get props => [];
}

class AddAddressInitial extends AddAddressState {
  const AddAddressInitial();
}

class AddAddressLoading extends AddAddressState {
  const AddAddressLoading();
}

class AddAddressSuccess extends AddAddressState {
  const AddAddressSuccess();
}

class AddAddressFailure extends AddAddressState {
  final String message;
  const AddAddressFailure(this.message);
  @override
  List<Object?> get props => [message];
}
