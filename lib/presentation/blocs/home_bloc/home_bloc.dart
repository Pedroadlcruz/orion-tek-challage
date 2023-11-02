import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:orion_tek_challenge/core/errors/app_failure.dart";
import "package:orion_tek_challenge/domain/company_repository.dart";

import '../../../core/services/local_storage/database/app_database.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CompanyRepository companiesRepository;
  HomeBloc({
    required this.companiesRepository,
  }) : super(const HomeInitial()) {
    on<LoadCompanies>(_onLoadCompanies);
    on<DeleteCompany>(_onDeleteCompany);
  }

  FutureOr<void> _onLoadCompanies(
    LoadCompanies event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    final result = await companiesRepository.loadCompanies();
    result.fold(
      (e) => emit(HomeFailure(e.message)),
      (companies) => emit(HomeSuccess(companies)),
    );
  }

  FutureOr<void> _onDeleteCompany(
    DeleteCompany event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    final result = await companiesRepository.deleteCompany(event.id);
    result.fold(
      (e) => emit(HomeFailure(e.message)),
      (companies) => emit(HomeSuccess(companies)),
    );
  }
}
