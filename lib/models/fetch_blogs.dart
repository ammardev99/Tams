// lib/services/blog_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tams/models/blog_model.dart';

class BlogApiService {
  static const String apiUrl = 'https://travelagency-rho.vercel.app/api/blog';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> blogsList = jsonResponse['blogs'];

      return blogsList.map((model) => Blog.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
