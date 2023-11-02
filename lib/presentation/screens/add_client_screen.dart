import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/extensions/forms_validatiors.dart';
import 'package:orion_tek_challenge/core/extensions/strings_formmaters.dart';
import 'package:orion_tek_challenge/core/widgets/alerts.dart';
import 'package:orion_tek_challenge/core/widgets/app_btn.dart';
import 'package:orion_tek_challenge/data/models/client_params.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_client/add_client_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/add_address_screen.dart';
import 'package:orion_tek_challenge/presentation/screens/company_detail_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/services/local_storage/database/app_database.dart';

class AddClientScreen extends StatelessWidget {
  final Company company;
  const AddClientScreen({super.key, required this.company});
  static const String routeName = 'add_client_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.addClient)),
      body: BlocListener<AddClientBloc, AddClientState>(
        listener: (context, state) {
          if (state is AddClientSuccess) {
            Alerts.successExtraAction(
              context: context,
              content: "Cliente creado exitosamente, desea agregar dirección",
              callToAction: "Agregar dirección",
              onBack: () => Navigator.pushReplacementNamed(
                  context, CompanyDetailScreen.routeName,
                  arguments: company),
              onCallToAction: () {
                Navigator.pushNamed(context, AddAddressScreen.routeName,
                    arguments: state.clientId);
              },
            );
          }
          if (state is AddClientFailure) {
            Alerts.alertDialog(
              context: context,
              content: state.message,
              onOk: () => Navigator.of(context).pop(),
              isSuccess: false,
            );
          }
        },
        child: AddClientForm(
          company: company,
        ),
      ),
    );
  }
}

class AddClientForm extends StatefulWidget {
  final Company company;
  const AddClientForm({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  State<AddClientForm> createState() => AddClientFormState();
}

class AddClientFormState extends State<AddClientForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addClientBloc = context.watch<AddClientBloc>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                Strings.addClient,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Nombre del Cliente",
                  labelText: "Nombre",
                ),
                onFieldSubmitted: (_) => _onSummit(),
                validator: (email) => email!.isNameValid,
              ),
            ),
            const SizedBox(height: 49),
            AppBtn(
              label: Strings.create,
              onPressed:
                  addClientBloc.isLoading ? null : () async => _onSummit(),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  void _onSummit() async {
    if (_formKey.currentState?.validate() == true) {
      final formattedName = nameController.text.normalizeName;
      FocusScope.of(context).unfocus();
      context.read<AddClientBloc>().add(
            AddClient(
              ClientParams(
                company: widget.company.id,
                name: formattedName,
              ),
            ),
          );
    }
  }
}
