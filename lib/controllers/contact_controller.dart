import 'package:get/get.dart';

import '../models/contact_model.dart';
import '../services/firebase_service.dart';


class ContactController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  var contacts = <Contact>[].obs;

  @override
  void onInit() {
    contacts.bindStream(_firebaseService.getContacts());
    super.onInit();
  }

  void addContact(Contact contact) {
    _firebaseService.addContact(contact);
  }

  void updateContact(Contact contact) {
    _firebaseService.updateContact(contact);
  }

  void deleteContact(String id) {
    _firebaseService.deleteContact(id);
  }
}
