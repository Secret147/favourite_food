import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserLogin {
  String email;
  String password;
  UserLogin({
    required this.email,
    required this.password,
  });

  UserLogin copyWith({
    String? email,
    String? password,
  }) {
    return UserLogin(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLogin.fromJson(String source) =>
      UserLogin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserLogin(email: $email, password: $password)';
}
