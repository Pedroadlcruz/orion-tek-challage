import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';

import '../../../data/models/address_params.dart';
import '../../../domain/company_repository.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final CompanyRepository companiesRepository;
  AddAddressBloc({required this.companiesRepository})
      : super(const AddAddressInitial()) {
    on<CreateAddress>(_onCreateAddress);
  }

  FutureOr<void> _onCreateAddress(
    CreateAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddClientLoading());
    final result = await companiesRepository.createAddress(event.addressData);
    result.fold(
      (e) => emit(AddClientFailure(e.message)),
      (_) => emit(const AddClientSuccess()),
    );
  }
}
