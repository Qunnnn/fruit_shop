import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'dart:math' as math;
import 'package:fruit_shop/utils/utils.dart';
import '../constants/app_constants.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: product.color,
          boxShadow: boxShadow,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: 15 * math.pi / 180,
                child: Image.asset(
                  product.image,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: boxShadow,
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.solidHeart,
                    size: 15,
                    color: product.isSelected == true
                        ? kPrimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: product.color.withOpacity(0.7),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        PriceWidget(product.price),
                        Row(
                          children: [
                            Text(
                              'See More',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              FontAwesomeIcons.arrowTrendUp,
                              color: Colors.red,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
