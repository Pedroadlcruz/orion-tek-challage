import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/constants/strings.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_company_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/company_detail_screen.dart';
import 'package:orion_tek_challenge/presentation/widgets/company_card.dart';
import 'package:orion_tek_challenge/presentation/widgets/failure_widget.dart';
import 'package:orion_tek_challenge/service_locator.dart';

import '../widgets/empty_widget.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.companies)),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return _Body(state.companies);
          } else if (state is HomeFailure) {
            return FailureWidget(message: state.message);
          } else {
            return const LoadingWidget();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DriftDbViewer(sl<AppDatabase>()))),
        child: const Icon(Icons.dashboard),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<Company> companies;
  const _Body(this.companies);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: companies.isNotEmpty,
      replacement: EmptyWidget(
        onButtonPressed: () async {
          Navigator.pushNamed(context, AddCompanyScreen.routeName);
        },
        icon: Icons.theater_comedy_sharp,
        message: Strings.emptyCompanyMessage,
        callToAction: Strings.emptyCompanyCallToAction,
      ),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16, top: 36),
            child: Text(
              "Lista de empresas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
          ...companies.map(
            (company) => CompanyCard(
              onDelete: () =>
                  context.read<HomeBloc>().add(DeleteCompany(company.id)),
              onTap: () => Navigator.of(context)
                  .pushNamed(CompanyDetailScreen.routeName, arguments: company),
              name: company.name,
              logo: company.logo ?? Strings.defaultLogo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0)
                .copyWith(top: 30, bottom: 80),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, AddCompanyScreen.routeName);
              },
              child: const Text(Strings.emptyCompanyCallToAction),
            ),
          ),
        ],
      ),
    );
  }
}
