import 'package:flutter/material.dart';
import 'package:my_food_admin_app/utils/dimensions.dart';
import 'package:my_food_admin_app/widgets/details_column.dart';
import 'package:my_food_admin_app/widgets/large_text.dart';

class ProductIcon extends StatelessWidget {
  const ProductIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
        color: Colors.blueGrey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 8,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("/images/food1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          LargeText(text: "Shawarma"),
        ],
      ),
    );
  }
}
