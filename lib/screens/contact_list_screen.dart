import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import 'contact_detail_screen.dart';
import 'contact_edit_screen.dart';

class ContactListScreen extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(ContactEditScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (contactController.contacts.isEmpty) {
          return const Center(child: Text('No contacts found.'));
        } else {
          return ListView.builder(
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              final contact = contactController.contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                onTap: () => Get.to(ContactDetailScreen(contact: contact)),
              );
            },
          );
        }
      }),
    );
  }
}
