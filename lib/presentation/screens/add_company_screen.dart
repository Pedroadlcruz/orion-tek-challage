import 'package:flutter/material.dart';
import 'package:orion_tek_challenge/core/extensions/forms_validatiors.dart';
import 'package:orion_tek_challenge/core/widgets/app_btn.dart';

import '../../core/constants/strings.dart';

class AddCompanyScreen extends StatelessWidget {
  const AddCompanyScreen({super.key});
  static const String routeName = 'add_company_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.addCompany)),
      body: const AddCompanyForm(),
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
                onFieldSubmitted: (_) {},
                validator: (email) => email!.isNameValid,
              ),
            ),
            const SizedBox(height: 49),
            AppBtn(
              label: Strings.create,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                _onSummit();
              },
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  void _onSummit() async {
    if (_formKey.currentState?.validate() == true) {
      //TODO: invoke
    }
  }
}
