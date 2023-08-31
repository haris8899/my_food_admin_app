import 'package:flutter/material.dart';
import 'package:my_food_admin_app/UserManagement/user-signin-page.dart';
import 'package:my_food_admin_app/UserManagement/user-signup-page.dart';

class SignInOrRegisterWidget extends StatefulWidget {
  SignInOrRegisterWidget({super.key});

  @override
  State<SignInOrRegisterWidget> createState() => _SignInOrRegisterWidgetState();
}

class _SignInOrRegisterWidgetState extends State<SignInOrRegisterWidget> {
  bool TogglePage = true;
  void toggle() {
    setState(() {
      TogglePage = !TogglePage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TogglePage
        ? UserSignInWidget(
            onTapReg: toggle,
          )
        : UserSignUpWidget(
          onTapReg: toggle,
        );
  }
}
