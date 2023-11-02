import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/services/local_storage/database/app_database.dart';

class CompanyDetailScreen extends StatelessWidget {
  final Company company;
  const CompanyDetailScreen({super.key, required this.company});
  static const String routeName = 'company_detail_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.companyDetail)),
      body: Center(
        child: Text(company.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add_reaction_outlined),
      ),
    );
  }
}
