import 'dart:developer';
import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/auth/services/user_database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier
{
  bool isLoading = false;

  final _service = AuthService();
  final _userService = UserDatabaseService();
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
    if(_user != null)
    {
        final a = await _userService.createUser(
        UserModel.fromFirebaseUser(_user!),

      );
      log("jja ${a}");
    }
    log("login successfully ${_user}");

    isLoading = false;
    notifyListeners();
  }


}