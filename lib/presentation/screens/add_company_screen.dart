import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_tek_challenge/core/extensions/forms_validatiors.dart';
import 'package:orion_tek_challenge/core/extensions/strings_formmaters.dart';
import 'package:orion_tek_challenge/core/widgets/alerts.dart';
import 'package:orion_tek_challenge/core/widgets/app_btn.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_company/add_company_bloc.dart';
import 'package:orion_tek_challenge/presentation/screens/home_screen.dart';

import '../../core/constants/strings.dart';

class AddCompanyScreen extends StatelessWidget {
  const AddCompanyScreen({super.key});
  static const String routeName = 'add_company_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.addCompany)),
      body: BlocListener<AddCompanyBloc, AddCompanyState>(
        listener: (context, state) {
          if (state is AddCompanySuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          }
          if (state is AddCompanyFailure) {
            Alerts.alertDialog(
              context: context,
              content: state.message,
              onOk: () => Navigator.of(context).pop(),
              isSuccess: false,
            );
          }
        },
        child: const AddCompanyForm(),
      ),
    );
  }
}

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCompanyForm> createState() => AddCompanyFormState();
}

class AddCompanyFormState extends State<AddCompanyForm> {
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
    final addCompanyBloc = context.watch<AddCompanyBloc>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                Strings.addCompany,
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
                  hintText: "Nombre de la empresa",
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
                  addCompanyBloc.isLoading ? null : () async => _onSummit(),
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
      context.read<AddCompanyBloc>().add(AddCompany(formattedName));
    }
  }
}
