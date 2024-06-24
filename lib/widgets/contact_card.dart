import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  ContactCard({required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.phone),
        onTap: onTap,
      ),
    );
  }
}
