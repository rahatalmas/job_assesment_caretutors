class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
