import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:orion_tek_challenge/core/errors/app_failure.dart";
import "package:orion_tek_challenge/domain/company_repository.dart";

part 'add_company_event.dart';
part 'add_company_state.dart';

class AddCompanyBloc extends Bloc<AddCompanyEvent, AddCompanyState> {
  final CompanyRepository companiesRepository;
  AddCompanyBloc({
    required this.companiesRepository,
  }) : super(const AddCompanyInitial()) {
    on<AddCompany>(_onAddCompany);
  }
  bool get isLoading => state == const AddCompanyLoading();
  FutureOr<void> _onAddCompany(
      AddCompany event, Emitter<AddCompanyState> emit) async {
    emit(const AddCompanyLoading());
    final result = await companiesRepository.createCompany(event.name);
    result.fold(
      (e) => emit(AddCompanyFailure(e.message)),
      (_) => emit(const AddCompanySuccess()),
    );
  }
}
