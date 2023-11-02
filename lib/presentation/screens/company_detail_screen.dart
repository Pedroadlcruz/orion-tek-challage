import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/company_detail/company_detail_bloc.dart';
import 'package:orion_tek_challenge/presentation/widgets/failure_widget.dart';
import 'package:orion_tek_challenge/presentation/widgets/loading_widget.dart';

import '../../core/constants/strings.dart';
import '../../core/services/local_storage/database/app_database.dart';
import '../widgets/empty_widget.dart';

class CompanyDetailScreen extends StatelessWidget {
  final Company company;
  const CompanyDetailScreen({super.key, required this.company});
  static const String routeName = 'company_detail_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.companyDetail)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              company.name,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          BlocBuilder<CompanyDetailBloc, CompanyDetailState>(
            builder: (BuildContext context, state) {
              if (state is CompanyDetailSuccess) {
                return Visibility(
                  visible: state.clients.isNotEmpty,
                  replacement: EmptyWidget(
                    onButtonPressed: () async {
                      // Navigator.pushNamed(context, AddCompanyScreen.routeName);
                    },
                    icon: Icons.app_blocking_outlined,
                    message: 'Usted no tiene clientes registrados',
                    callToAction: 'Agregar cliente',
                  ),
                  child: ListView(
                    children: const [
                      // ...companies.map(
                      //   (company) => CompanyCard(
                      //     onTap: () => Navigator.of(context)
                      //         .pushNamed(CompanyDetailScreen.routeName, arguments: company),
                      //     name: company.name,
                      //     logo: company.logo ??
                      //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtH6ctIDoPfhmlQreh9wC8fy65XzroD6O5Xg&usqp=CAU",
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 32.0)
                      //       .copyWith(top: 30, bottom: 80),
                      //   child: ElevatedButton(
                      //     onPressed: () async {
                      //       Navigator.pushNamed(context, AddCompanyScreen.routeName);
                      //     },
                      //     child: const Text('Agregar empresa'),
                      //   ),
                      // ),
                    ],
                  ),
                );
              } else if (state is CompanyDetailFailure) {
                return FailureWidget(message: state.message);
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add_reaction_outlined),
      ),
    );
  }
}
