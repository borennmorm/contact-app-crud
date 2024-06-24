import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_controller.dart';
import '../models/contact_model.dart';

class ContactEditScreen extends StatelessWidget {
  final Contact? contact;
  final ContactController contactController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ContactEditScreen({this.contact}) {
    if (contact != null) {
      nameController.text = contact!.name;
      phoneController.text = contact!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (contact == null) {
                  contactController.addContact(Contact(
                    id: '',
                    name: nameController.text,
                    phone: phoneController.text,
                  ));
                } else {
                  contactController.updateContact(Contact(
                    id: contact!.id,
                    name: nameController.text,
                    phone: phoneController.text,
                  ));
                }
                Get.back();
              },
              child: Text(contact == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
