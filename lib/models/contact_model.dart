class Contact {
  String id;
  String name;
  String phone;

  Contact({required this.id, required this.name, required this.phone});

  factory Contact.fromMap(Map<String, dynamic> data, String documentId) {
    return Contact(
      id: documentId,
      name: data['name'],
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}
