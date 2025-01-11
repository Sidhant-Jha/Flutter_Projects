import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_view/api_service.dart';
import 'package:profile_view/user_model.dart';

class UserProvider extends ChangeNotifier
{
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUser() async
  {
    _isLoading = true;
    notifyListeners();
    try{
      _users = await _apiService.fetchUsers();
    }
    catch(e)
    {
      log('Error Fetching Users $e');
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
  
}