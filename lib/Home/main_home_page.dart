import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_admin_app/utils/dimensions.dart';
import 'package:my_food_admin_app/widgets/action_icon_button.dart';
import 'package:my_food_admin_app/widgets/large_text.dart';

class Hompage extends StatefulWidget {
  Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  final User = FirebaseAuth.instance.currentUser!;
  int TabIndex = 0;
  List<String> Tabs = ["Dashboard", "Products", "Orders"];
  List<Widget> Pages = [
    Center(child: Text("Dashboard")),
    Center(child: Text("Products")),
    Center(child: Text("Orders")),
  ];
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        actions: [
          Text(
            User.email!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: SignUserOut,
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            hoverColor: Colors.blue,
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              child: ListView.separated(
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        TabIndex = index;
                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: AnimatedContainer(
                            margin: EdgeInsets.all(10),
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: (TabIndex == index)
                                  ? Colors.blue
                                  : Colors.lightBlue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: LargeText(
                                    text: Tabs[index],
                                    color: (TabIndex == index)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, int index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemCount: Tabs.length,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: Pages[TabIndex],
            ),
          ),
        ],
      ),
    );
  }
}
