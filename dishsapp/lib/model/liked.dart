// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class Liked {
  String? email;
  int productId;
  Liked({
    this.email,
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'productId': productId,
    };
  }

  factory Liked.fromMap(Map<String, dynamic> map) {
    return Liked(
      email: map['email'] != null ? map['email'] as String : null,
      productId: map['productId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Liked.fromJson(String source) =>
      Liked.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Liked(email: $email, productId: $productId)';

  Liked copyWith({
    String? email,
    int? productId,
  }) {
    return Liked(
      email: email ?? this.email,
      productId: productId ?? this.productId,
    );
  }
}
