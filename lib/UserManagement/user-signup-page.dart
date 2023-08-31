import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_admin_app/utils/dimensions.dart';
import 'package:my_food_admin_app/widgets/email_field.dart';
import 'package:my_food_admin_app/widgets/large_text.dart';
import 'package:my_food_admin_app/widgets/my_button.dart';
import 'package:my_food_admin_app/widgets/password_field.dart';

class UserSignUpWidget extends StatefulWidget {
  final Function()? onTapReg;
  UserSignUpWidget({super.key, required this.onTapReg});

  @override
  State<UserSignUpWidget> createState() => _UserSignUpWidgetState();
}

class _UserSignUpWidgetState extends State<UserSignUpWidget> {
  final UsernameController = TextEditingController();

  final PasswordController = TextEditingController();

  final ConfirmPasswordController = TextEditingController();

  void ShowErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
      ),
    );
  }

  void SignUserUp() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      if (PasswordController.text == ConfirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: UsernameController.text,
          password: PasswordController.text,
        );
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        ShowErrorMessage("Passwords Don't match!");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "invalid-email") {
        ShowErrorMessage("Email is Invalid");
      } else if (e.code == 'user-not-found') {
        ShowErrorMessage("No User exists with these credentials");
      } else if (e.code == 'wrong-password') {
        ShowErrorMessage("Password Incorrect");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: Dimensions.width120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimensions.BorderRadius30)),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(Dimensions.height30),
                  child: Column(
                    children: [
                      LargeText(
                        text: "Register",
                        size: Dimensions.height45,
                      ),
                      SizedBox(
                        height: Dimensions.height45,
                      ),
                      Container(
                        width: Dimensions.width120 * 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                Dimensions.BorderRadius15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            EmailField(
                                text: "Email", Controller: UsernameController),
                            PasswordField(
                              text: "Password",
                              Controller: PasswordController,
                            ),
                            PasswordField(
                              text: "Confirm Password",
                              Controller: ConfirmPasswordController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      MyButton(
                        text: "Register",
                        onTap: SignUserUp,
                      ),
                      SizedBox(
                        height: Dimensions.height45,
                      ),
                      Text(
                        "Continue with social media",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: Dimensions.height45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.BorderRadius30),
                                  color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Google",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width30,
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.height45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.BorderRadius30),
                                  color: Colors.black),
                              child: Center(
                                child: Text(
                                  "Facebook",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a Member? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          InkWell(
                              child: Text(
                                "Log in",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: widget.onTapReg),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
