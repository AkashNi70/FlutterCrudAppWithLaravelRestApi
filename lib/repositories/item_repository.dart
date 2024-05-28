import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item.dart';

class ItemRepository {
  final String baseUrl = 'http://192.168.1.9/crudapi/public/api';

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<Item>> fetchItems() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/items'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((data) => Item.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<bool> addItem(String name) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/add-item'),
      headers: {'Authorization': 'Bearer $token'},
      body: {'name': name},
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      throw Exception(responseData['message'] ?? 'Failed to add item');
    }
  }

  Future<bool> updateItem(int id, String name) async {
    final token = await getToken();
    final response = await http.put(
      Uri.parse('$baseUrl/items/update/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'name': name}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      throw Exception(responseData['error'] ?? 'Failed to update item');
    }
  }


  Future<void> deleteItem(int id) async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/items/delete/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete item');
    }
  }
}
