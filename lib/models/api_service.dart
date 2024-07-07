// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tams/models/service.dart';

class ApiService {
  static const String apiUrl = 'https://travelagency-rho.vercel.app/api/service';

  Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> servicesList = jsonResponse['services'];

      return servicesList.map((model) => Service.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future<int> fetchNumberOfServices() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> servicesList = jsonResponse['services'];
      return servicesList.length;
    } else {
      throw Exception('Failed to load number of services');
    }
  }
}
