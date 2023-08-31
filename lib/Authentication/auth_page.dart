import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_admin_app/Home/main_home_page.dart';
import 'package:my_food_admin_app/UserManagement/SignInorSignUp.dart';
import 'package:my_food_admin_app/UserManagement/user-signin-page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User Log Check
          if (snapshot.hasData) {
            return Hompage();
          } else {
            return SignInOrRegisterWidget();
          }
        },
      ),
    );
  }
}
