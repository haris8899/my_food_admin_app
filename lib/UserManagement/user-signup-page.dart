import 'package:flutter/material.dart';
import 'package:my_food_admin_app/utils/dimensions.dart';
import 'package:my_food_admin_app/widgets/email_field.dart';
import 'package:my_food_admin_app/widgets/large_text.dart';
import 'package:my_food_admin_app/widgets/password_field.dart';

class UserSignUpWidget extends StatelessWidget {
  const UserSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
              Container(
                alignment: Alignment.center,
                width: Dimensions.width120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.BorderRadius30)
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height30),
                    child: Column(
                      children: [
                        LargeText(text: "Register",size: Dimensions.height45,),
                        SizedBox(height: Dimensions.height45,),
                        Container(
                          width: Dimensions.width120 *3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: [
                              EmailField(text: "Email"),
                              PasswordField(text: "Password"),
                              PasswordField(text: "Confirm Password"),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                            color: Colors.orange[900]
                          ),
                          child: Center(
                            child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: Dimensions.height45,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: Dimensions.height30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                                  color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width30,),
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                                  color: Colors.black
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ],
                        ),
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