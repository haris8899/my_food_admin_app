import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hompage extends StatelessWidget {
  Hompage({super.key});

  final User = FirebaseAuth.instance.currentUser!;
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          Text(
            User.email!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: SignUserOut,
            icon: Icon(Icons.logout),
            hoverColor: Colors.blue,
          )
        ],
      ),
      body: Center(child: Text("Logged in")),
    );
  }
}
