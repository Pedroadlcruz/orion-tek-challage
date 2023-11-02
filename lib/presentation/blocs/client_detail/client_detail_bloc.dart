import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';

import '../../../core/services/local_storage/database/app_database.dart';
import '../../../domain/company_repository.dart';

part 'client_detail_event.dart';
part 'client_detail_state.dart';

class ClientDetailBloc extends Bloc<ClientDetailEvent, ClientDetailState> {
  final CompanyRepository companiesRepository;
  ClientDetailBloc({required this.companiesRepository})
      : super(const ClientDetailInitial()) {
    on<LoadAddresses>(_onLoadAddresses);
    on<DeleteAddress>(_onDeleteAddress);
  }

  FutureOr<void> _onLoadAddresses(
    LoadAddresses event,
    Emitter<ClientDetailState> emit,
  ) async {
    emit(const ClientDetailLoading());
    final result =
        await companiesRepository.getClientsAddresses(event.clientId);
    result.fold(
      (e) => emit(ClientDetailFailure(e.message)),
      (address) => emit(ClientDetailSuccess(address)),
    );
  }

  FutureOr<void> _onDeleteAddress(
    DeleteAddress event,
    Emitter<ClientDetailState> emit,
  ) async {
    emit(const ClientDetailLoading());
    final result = await companiesRepository.deleteAddress(event.address);
    result.fold(
      (e) => emit(ClientDetailFailure(e.message)),
      (address) => emit(ClientDetailSuccess(address)),
    );
  }
}
