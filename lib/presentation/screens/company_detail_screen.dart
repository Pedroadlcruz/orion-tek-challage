import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/company_detail/company_detail_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_client_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/client_detail_screen.dart';
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
                      Navigator.pushNamed(context, AddClientScreen.routeName,
                          arguments: company);
                    },
                    icon: Icons.app_blocking_outlined,
                    message: '${company.name} no tiene clientes registrados',
                    callToAction: 'Agregar cliente',
                  ),
                  child: Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Lista de clientes",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ...state.clients.map(
                          (client) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: ListTile(
                              onTap: () => Navigator.of(context).pushNamed(
                                  ClientDetailScreen.routeName,
                                  arguments: client),
                              shape: Border.all(color: Colors.blueGrey),
                              leading: CircleAvatar(
                                child: Text(client.name.substring(0, 1)),
                              ),
                              title: Text(client.name),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  //TODO: Delete cliente
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
        onPressed: () => Navigator.pushNamed(context, AddClientScreen.routeName,
            arguments: company),
        child: const Icon(Icons.add_reaction_outlined),
      ),
    );
  }
}
