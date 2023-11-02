import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/extensions/forms_validatiors.dart';
import 'package:orion_tek_challenge/core/extensions/strings_formmaters.dart';
import 'package:orion_tek_challenge/core/widgets/alerts.dart';
import 'package:orion_tek_challenge/core/widgets/app_btn.dart';
import 'package:orion_tek_challenge/data/models/address_params.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_address/add_address_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/client_detail_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/services/local_storage/database/app_database.dart';

class AddAddressScreen extends StatelessWidget {
  final Client client;
  const AddAddressScreen({super.key, required this.client});
  static const String routeName = 'add_address_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.addClient)),
      body: BlocListener<AddAddressBloc, AddAddressState>(
        listener: (context, state) {
          if (state is AddAddressSuccess) {
            Alerts.successExtraAction(
              context: context,
              content:
                  "Dirección creada con éxito. ¿Desea agregar otra dirección?",
              callToAction: "Agregar dirección",
              onBack: () => Navigator.pushReplacementNamed(
                  context, ClientDetailScreen.routeName,
                  arguments: client),
              onCallToAction: () => Navigator.pushReplacementNamed(
                  context, AddAddressScreen.routeName,
                  arguments: client),
            );
          }
          if (state is AddAddressFailure) {
            Alerts.alertDialog(
              context: context,
              content: state.message,
              onOk: () => Navigator.of(context).pop(),
              isSuccess: false,
            );
          }
        },
        child: AddAddressForm(
          client: client,
        ),
      ),
    );
  }
}

class AddAddressForm extends StatefulWidget {
  final Client client;
  const AddAddressForm({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<AddAddressForm> createState() => AddAddressFormState();
}

class AddAddressFormState extends State<AddAddressForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController provinceController;
  late TextEditingController streetController;
  late TextEditingController numberController;

  late FocusNode nameFocusNode;
  late FocusNode provinceFocusNode;
  late FocusNode streetFocusNode;
  late FocusNode numberFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    provinceController = TextEditingController();
    streetController = TextEditingController();
    numberController = TextEditingController();

    nameFocusNode = FocusNode();
    provinceFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    numberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController.dispose();
    provinceController.dispose();
    streetController.dispose();
    numberController.dispose();

    nameFocusNode.dispose();
    provinceFocusNode.dispose();
    streetFocusNode.dispose();
    numberFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addAddressBloc = context.watch<AddAddressBloc>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                Strings.addAddress,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32)
                  .copyWith(bottom: 12),
              child: TextFormField(
                focusNode: nameFocusNode,
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Mi Casa",
                  labelText: "Nombre",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(streetFocusNode);
                },
                validator: (nombre) => nombre!.isNameValid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32)
                  .copyWith(bottom: 12),
              child: TextFormField(
                focusNode: streetFocusNode,
                controller: streetController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Calle primera",
                  labelText: "Calle",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(numberFocusNode);
                },
                validator: (nombre) => nombre!.isNameValid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32)
                  .copyWith(bottom: 12),
              child: TextFormField(
                focusNode: numberFocusNode,
                controller: numberController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "#15",
                  labelText: "Número",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(provinceFocusNode);
                },
                validator: (nombre) => nombre!.isNameValid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32)
                  .copyWith(bottom: 12),
              child: TextFormField(
                focusNode: provinceFocusNode,
                controller: provinceController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Santo Domingo",
                  labelText: "Provincia",
                ),
                onFieldSubmitted: (_) {
                  provinceFocusNode.unfocus();
                  _onSummit();
                },
                validator: (nombre) => nombre!.isNameValid,
              ),
            ),
            const SizedBox(height: 49),
            AppBtn(
              label: Strings.create,
              onPressed:
                  addAddressBloc.isLoading ? null : () async => _onSummit(),
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
      context.read<AddAddressBloc>().add(
            CreateAddress(
              AddressParams(
                client: widget.client.id,
                name: formattedName,
                street: streetController.text,
                number: numberController.text,
                province: provinceController.text,
              ),
            ),
          );
    }
  }
}
