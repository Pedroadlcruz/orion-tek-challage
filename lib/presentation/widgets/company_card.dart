import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final String name;
  final String logo;
  final void Function()? onTap;
  final void Function()? onDelete;

  const CompanyCard({
    super.key,
    required this.name,
    required this.logo,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        onTap: onTap,
        shape: Border.all(color: Colors.blueGrey),
        leading: CircleAvatar(
          child: Image.network(
            logo,
            width: double.infinity,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
