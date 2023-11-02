part of 'add_address_bloc.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();
  @override
  List<Object?> get props => [];
}

class CreateAddress extends AddAddressEvent {
  final AddressParams addressData;
  const CreateAddress(this.addressData);

  @override
  List<Object?> get props => [addressData];
}
