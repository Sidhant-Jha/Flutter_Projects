import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profile_view/model/user_model.dart';
class ApiService {

  final String _baseUrl = "https://api.freeapi.app/api/v1/public/books";

  Future<List<User>> fetchUsers() async
  {
    final response = await http.get(Uri.parse("$_baseUrl?page=1&limit=50"));

    if(response.statusCode == 200)
    {
      final List<dynamic> results = json.decode(response.body)['data']['data'];
      return results.map((json) => User.fromJson(json)).toList();
    } else
    {
      throw Exception('Failed to User');
    }
  }


}