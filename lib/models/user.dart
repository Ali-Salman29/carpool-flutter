class User {
  final int? id;
  final String username;
  final String? firstname;
  final String? lastname;
  final String email;
  final String phone;
  final String? password;

  User({
    this.id,
    this.password,
    this.firstname,
    this.lastname,
    required this.username,
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

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'phone_number': phone,
      'password': password,
      'password2': password,
    };
  }
}
