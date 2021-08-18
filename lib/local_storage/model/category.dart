import 'package:flutter/foundation.dart';

class Category {
  int id;
  String name;
  Category({
    this.id,
    @required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}
