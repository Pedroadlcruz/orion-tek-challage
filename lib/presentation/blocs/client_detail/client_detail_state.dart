part of 'client_detail_bloc.dart';

abstract class ClientDetailState extends Equatable {
  const ClientDetailState();
  @override
  List<Object?> get props => [];
}

class ClientDetailInitial extends ClientDetailState {
  const ClientDetailInitial();
}

class ClientDetailLoading extends ClientDetailState {
  const ClientDetailLoading();
}

class ClientDetailSuccess extends ClientDetailState {
  final List<Address> addresses;
  const ClientDetailSuccess(this.addresses);
  @override
  List<Object?> get props => [addresses];
}

class ClientDetailFailure extends ClientDetailState {
  final String message;
  const ClientDetailFailure(this.message);
  @override
  List<Object?> get props => [message];
}
