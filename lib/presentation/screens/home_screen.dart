import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/constants/strings.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_company_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/company_detail_screen.dart';
import 'package:orion_tek_challenge/presentation/widgets/company_card.dart';
import 'package:orion_tek_challenge/service_locator.dart';

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
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DriftDbViewer(sl<AppDatabase>()))),
        tooltip: 'Increment',
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
    return Builder(builder: (context) {
      if (companies.isEmpty) {
        return const _NoCompaniesWidget();
      } else {
        return ListView(
          children: [
            ...companies.map(
              (company) => CompanyCard(
                onTap: () => Navigator.of(context).pushNamed(
                    CompanyDetailScreen.routeName,
                    arguments: company),
                name: company.name,
                logo: company.logo ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtH6ctIDoPfhmlQreh9wC8fy65XzroD6O5Xg&usqp=CAU",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0)
                  .copyWith(top: 30, bottom: 80),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, AddCompanyScreen.routeName);
                },
                child: const Text('Agregar empresa'),
              ),
            ),
          ],
        );
      }
    });
  }
}

class _NoCompaniesWidget extends StatelessWidget {
  const _NoCompaniesWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Icon(
                  Icons.theater_comedy_sharp,
                  size: 50,
                ),
              ),
              const Text(
                'Usted no tiene empresa registrada',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0)
                    .copyWith(top: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    // final companiesDao = sl<CompaniesDao>();
                    // await companiesDao.insertCompany(const CompaniesCompanion(
                    //   name: drift.Value("Male"),
                    // ));
                    Navigator.pushNamed(context, AddCompanyScreen.routeName);
                  },
                  child: const Text('Agregar empresa'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
