class User {
  final int? id;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;

  User({
    this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      username: data['username'] ?? '',
      firstname: data['first_name'] ?? '',
      lastname: data['last_name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone_number'] ?? '',
    );
  }
}
