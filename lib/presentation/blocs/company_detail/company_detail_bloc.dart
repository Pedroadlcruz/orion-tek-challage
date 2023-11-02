import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';

import '../../../domain/company_repository.dart';

part 'company_detail_event.dart';
part 'company_detail_state.dart';

class CompanyDetailBloc extends Bloc<CompanyDetailEvent, CompanyDetailState> {
  final CompanyRepository companiesRepository;
  CompanyDetailBloc({required this.companiesRepository})
      : super(const CompanyDetailInitial()) {
    on<LoadClients>(_onLoadClients);
    on<DeleteClient>(_onDeleteClient);
  }

  FutureOr<void> _onLoadClients(
      LoadClients event, Emitter<CompanyDetailState> emit) async {
    emit(const CompanyDetailLoading());
    final result = await companiesRepository.getCompanyClients(event.companyId);
    result.fold(
      (e) => emit(CompanyDetailFailure(e.message)),
      (clients) => emit(CompanyDetailSuccess(clients)),
    );
  }

  FutureOr<void> _onDeleteClient(
    DeleteClient event,
    Emitter<CompanyDetailState> emit,
  ) async {
    emit(const CompanyDetailLoading());
    final result = await companiesRepository.deleteClient(event.client);
    result.fold(
      (e) => emit(CompanyDetailFailure(e.message)),
      (clients) => emit(CompanyDetailSuccess(clients)),
    );
  }
}
