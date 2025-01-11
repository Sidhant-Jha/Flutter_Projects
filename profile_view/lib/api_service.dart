import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profile_view/user_model.dart';
class ApiService {

  final String _baseUrl = "https://randomuser.me/api";

  Future<List<User>> fetchUsers() async
  {
    final response = await http.get(Uri.parse("$_baseUrl?results=100"));

    if(response.statusCode == 200)
    {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results.map((json) => User.fromJson(json)).toList();
    } else
    {
      throw Exception('Failed to User');
    }
  }


}