import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_constants.dart';

final boxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 1,
    spreadRadius: 1,
    offset: const Offset(1, 1),
  ),
];
Widget IconWidget(IconData? icon , bool dot) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: boxShadow,
      color: Colors.white,
    ),
    child: Stack(alignment: Alignment.center, children: [
      Icon(
        icon,
        size: 15,
      ),
     if(dot)
       Positioned(
        top: 10,
        right: 7,
        child: Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
      ),
    ]),
  );
}

Widget PriceWidget(String price) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        text: '\$$price',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
    TextSpan(
        text: '/kg',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
  ]));
}
Widget quantityIcon(Color color, Function()? onTap, IconData? icon) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color == kPrimaryColor ? kSecondaryColor : kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: color == kPrimaryColor ? kPrimaryColor : Colors.white,
            size: 15,
          ),
        )),
  );
}
