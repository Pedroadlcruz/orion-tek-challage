import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';

import '../../../data/models/client_params.dart';
import '../../../domain/company_repository.dart';

part 'add_client_event.dart';
part 'add_client_state.dart';

class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  final CompanyRepository companiesRepository;
  AddClientBloc({required this.companiesRepository})
      : super(const AddClientInitial()) {
    on<AddClient>(_onAddClient);
  }
  bool get isLoading => state == const AddClientLoading();
  FutureOr<void> _onAddClient(
    AddClient event,
    Emitter<AddClientState> emit,
  ) async {
    emit(const AddClientLoading());
    final result = await companiesRepository.createClient(event.clientData);
    result.fold(
      (e) => emit(AddClientFailure(e.message)),
      (clientId) => emit(AddClientSuccess(clientId)),
    );
  }
}
