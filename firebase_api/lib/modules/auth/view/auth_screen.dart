import 'package:firebase_api/modules/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          context.read<AuthViewModel>().loginWithGoogleClickEvent();
        },
         child: Text("Login with Google")),
      ),
    );
  }
}