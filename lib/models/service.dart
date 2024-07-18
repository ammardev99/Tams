// lib/models/service.dart
import 'dart:typed_data';

class Service {
  String id;
  String title;
  String description;
  String startdate;
  String category;
  String duration;
  int price;
  Uint8List image;

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

  void copy(Service service) {
    id = service.id;
    title = service.title;
    description = service.description;
    startdate = service.startdate;
    category = service.category;
    duration = service.duration;
    price = service.price;
    image = service.image;
  }

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
