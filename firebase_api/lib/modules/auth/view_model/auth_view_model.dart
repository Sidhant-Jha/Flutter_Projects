import 'dart:developer';

import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier
{
  bool isLoading = false;

  final _service = AuthService();
  User? _user;

  bool get isAuthenticated => _user != null;

  void getUser() async
  {
    _user = await _service.getUser();
    notifyListeners();
  }

  void logoutClickEvent() async{
    await _service.logoutUser();
    _user = null;
    notifyListeners();
  }

  void loginWithGoogleClickEvent() async
  {
    isLoading = true;
    notifyListeners();

    _user = await _service.signInWithGoogle();
    log("login successfully ${_user}");

    isLoading = false;
    notifyListeners();
  }


}