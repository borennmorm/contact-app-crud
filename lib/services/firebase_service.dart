import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/contact_model.dart';


class FirebaseService {
  // This creates an instance of FirebaseFirestore which is the main entry point for the Cloud Firestore database.
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Purpose: To retrieve the list of contacts from the Firestore database in real-time.
  // Returns: A stream of lists of Contact objects.
  // How It Works:
  // collection('contacts'): Accesses the contacts collection in the Firestore database.
  // snapshots(): Listens to real-time updates from the contacts collection.
  // map((snapshot) => ...): Transforms each snapshot into a list of Contact objects using the fromMap factory constructor.
  Stream<List<Contact>> getContacts() {
    return _db.collection('contacts').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Contact.fromMap(doc.data(), doc.id)).toList()
    );
  }

  // Purpose: To add a new contact to the Firestore database.
  // Parameters:
  // contact: An instance of the Contact class.
  // Returns: A Future<void> indicating the operation's completion.
  // How It Works:
  // toMap(): Converts the Contact object into a map.
  // collection('contacts').add(...): Adds the map to the contacts collection in Firestore.
  Future<void> addContact(Contact contact) {
    return _db.collection('contacts').add(contact.toMap());
  }

  // Purpose: To update an existing contact in the Firestore database.
  // Parameters:
  // contact: An instance of the Contact class with updated data.
  // Returns: A Future<void> indicating the operation's completion.
  // How It Works:
  // toMap(): Converts the Contact object into a map.
  // collection('contacts').doc(contact.id).update(...): Updates the document with the specified id in the contacts collection with the new data.
  Future<void> updateContact(Contact contact) {
    return _db.collection('contacts').doc(contact.id).update(contact.toMap());
  }

  // Purpose: To delete a contact from the Firestore database.
  // Parameters:
  // id: The unique identifier of the contact to delete.
  // Returns: A Future<void> indicating the operation's completion.
  // How It Works:
  // collection('contacts').doc(id).delete(): Deletes the document with the specified id from the contacts collection.
  Future<void> deleteContact(String id) {
    return _db.collection('contacts').doc(id).delete();
  }
}
