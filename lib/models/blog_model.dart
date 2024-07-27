// lib/models/blog.dart
import 'dart:typed_data';

class Blog {
  final String id;
  final String title;
  final String location;
  final String memory;
  final String date;
  final String author;
  final Uint8List image;

  Blog({
    required this.id,
    required this.title,
    required this.location,
    required this.memory,
    required this.date,
    required this.author,
    required this.image,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'],
      title: json['title'],
      location: json['location'],
      memory: json['memory'],
      date: json['date'],
      author: json['author'],
      image: Uint8List.fromList(List<int>.from(json['image']['data'])),
    );
  }
}
