import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../models/contact_model.dart';
import 'contact_edit_screen.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;
  final ContactController contactController = Get.find();

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Get.to(ContactEditScreen(contact: contact)),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              contactController.deleteContact(contact.id);
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact.name}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Phone: ${contact.phone}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
