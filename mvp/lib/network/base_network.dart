import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = 'https://dattebayo-api.onrender.com/';

  static Future<List<dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[endpoint] ?? [];
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<Map<String, dynamic>> getDetailData(String endpoint, int id) async {
    final response = await http.get(Uri.parse(baseUrl + '$endpoint/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      
      if (data is List && data.isNotEmpty) {
        return data[0] as Map<String, dynamic>;
      } else if (data is Map<String, dynamic>) {
        return data;
      } else {
        throw Exception("Unexpected data format");
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}
