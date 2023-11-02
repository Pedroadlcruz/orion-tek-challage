import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/presentation/widgets/failure_widget.dart';
import 'package:orion_tek_challenge/presentation/widgets/loading_widget.dart';

import '../../core/constants/strings.dart';
import '../../core/services/local_storage/database/app_database.dart';
import '../blocs/client_detail/client_detail_bloc.dart';
import '../widgets/empty_widget.dart';

class ClientDetailScreen extends StatelessWidget {
  final Client client;
  const ClientDetailScreen({super.key, required this.client});
  static const String routeName = 'client_detail_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.clientDetail)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              'Direcciones de: ${client.name}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          BlocBuilder<ClientDetailBloc, ClientDetailState>(
            builder: (BuildContext context, state) {
              if (state is ClientDetailSuccess) {
                return Visibility(
                  visible: state.addresses.isNotEmpty,
                  replacement: EmptyWidget(
                    onButtonPressed: () async {
                      //TODO: Navigate to Add Address Screen
                      // Navigator.pushNamed(context, AddClientScreen.routeName,
                      //     arguments: client);
                    },
                    icon: Icons.app_blocking_outlined,
                    message: '${client.name} no tiene direcciones registrados',
                    callToAction: 'Agregar dirección',
                  ),
                  child: Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Lista de direcciones",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ...state.addresses.map(
                          (address) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: ListTile(
                              shape: Border.all(color: Colors.blueGrey),
                              leading: CircleAvatar(
                                child: Text(address.name.substring(0, 1)),
                              ),
                              title: Text(address.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${address.street}, ${address.number}'),
                                  Text(address.province),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  //TODO: GO TO CLIENT DETAIL
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ClientDetailFailure) {
                return FailureWidget(message: state.message);
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: NAVIGATE TO ADD ADDRESS
          // Navigator.pushNamed(context, AddClientScreen.routeName,
          //   arguments: client);
        },
        child: const Icon(Icons.add_location_outlined),
      ),
    );
  }
}
