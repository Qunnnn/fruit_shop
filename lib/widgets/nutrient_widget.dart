import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';

class NutrienWidget extends StatelessWidget {
  final Product product;
  final int index;
  const NutrienWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  product.nutrients[index][0],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  product.nutrients[index][1] + '/\5',
                  style: TextStyle(
                      color: nutrientsColor[index],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: buildIndicators(product.nutrients[index][0],
                  int.parse(product.nutrients[index][1]), index),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildIndicators(String nutrientType, int value, int index) {
  List<Widget> list = [];

  for (int i = 0; i < 5; i++) {
    list.add(i < value
        ? Indicator(nutrientType, true, index)
        : Indicator(nutrientType, false, index));
  }
  return list;
}

Widget Indicator(String nutrientType, bool isActived, int index) {
  IconData? icon;
  switch (nutrientType) {
    case 'Energy':
      icon = FontAwesomeIcons.bolt;
      break;
    case 'Freshness':
      icon = FontAwesomeIcons.glassWater;
      break;
    case 'Vitamin':
      icon = FontAwesomeIcons.rocket;
      break;
    default:
      icon = FontAwesomeIcons.fire;
  }
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: SizedBox(
      child: Icon(
        icon,
        color: isActived == true ? nutrientsColor[index] : Colors.black,
        size: 15,
      ),
    ),
  );
}
