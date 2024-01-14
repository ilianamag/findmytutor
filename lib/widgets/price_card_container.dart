
import 'package:flutter/material.dart';
import 'package:login/theme/app_decoration.dart';

class PriceContainer extends StatelessWidget {
  final String price;

  PriceContainer({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      alignment: Alignment.center,
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: '\ $price €/hour',
          border: InputBorder.none, // Remove the border
        ),
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}