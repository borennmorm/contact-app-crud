import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/contact_model.dart';


class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Contact>> getContacts() {
    return _db.collection('contacts').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Contact.fromMap(doc.data(), doc.id)).toList()
    );
  }

  Future<void> addContact(Contact contact) {
    return _db.collection('contacts').add(contact.toMap());
  }

  Future<void> updateContact(Contact contact) {
    return _db.collection('contacts').doc(contact.id).update(contact.toMap());
  }

  Future<void> deleteContact(String id) {
    return _db.collection('contacts').doc(id).delete();
  }
}
