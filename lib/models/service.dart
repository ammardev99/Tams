// lib/models/service.dart
import 'dart:typed_data';

class Service {
  final String id;
  final String title;
  final String description;
  final String startdate;
  final String category;
  final String duration;
  final int price;
  final Uint8List image;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.startdate,
    required this.category,
    required this.duration,
    required this.price,
    required this.image,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      startdate: json['startdate'],
      category: json['category'],
      duration: json['duration'],
      price: json['price'],
      image: Uint8List.fromList(List<int>.from(json['image']['data'])),
    );
  }
}


