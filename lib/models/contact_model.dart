class Contact {
  String id;
  String name;
  String phone;

  Contact({required this.id, required this.name, required this.phone});

  // Purpose: To create a Contact object from a map (which is how data is represented in Firebase).
  // Parameters:
  // - data: A map containing the contact data.
  // - documentId: The unique identifier for the document, which will be used as the contact's id.
  // - Returns: A new instance of the Contact class with the properties populated from the map.
  factory Contact.fromMap(Map<String, dynamic> data, String documentId) {
    return Contact(
      id: documentId,
      name: data['name'],
      phone: data['phone'],
    );
  }

  // Purpose: To convert a Contact object into a map, which is the format required to store data in Firebase.
  // Returns: A map containing the contact's data, excluding the id (since the id is typically managed by Firebase).
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}
