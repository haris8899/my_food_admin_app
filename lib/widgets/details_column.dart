import 'package:flutter/material.dart';
import 'package:my_food_admin_app/utils/dimensions.dart';
import 'package:my_food_admin_app/widgets/large_text.dart';
import 'package:my_food_admin_app/widgets/small_text.dart';

class DetailsColumn extends StatelessWidget {
  final String text;
  const DetailsColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(text: text,size: Dimensions.height25,),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "12.2k"),
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                    ]);
  }
}