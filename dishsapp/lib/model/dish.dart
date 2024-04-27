import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dish {
  int id;
  String title;
  String description;
  String image;
  int liked;

  Dish({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.liked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'liked': liked,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      liked: map['liked'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dish.fromJson(String source) =>
      Dish.fromMap(json.decode(source) as Map<String, dynamic>);
}
