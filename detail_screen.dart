import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/constants/app_constants.dart';
import 'package:fruit_shop/utils/utils.dart';
import 'package:fruit_shop/widgets/nutrient_widget.dart';
import 'lib/data/data.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantityAmount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.product.color,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      right: 30,
                      left: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: IconWidget(
                                  FontAwesomeIcons.arrowLeft, false)),
                          Text(
                            'Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                              onTap: (() {}),
                              child: IconWidget(
                                  FontAwesomeIcons.bagShopping, true)),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                          angle: 15 * math.pi / 180,
                          child: Image.asset(
                            widget.product.image,
                            height: MediaQuery.of(context).size.height * 0.4,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: '\$' + widget.product.price,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '/kg',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ])),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: boxShadow,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  quantityIcon(kPrimaryColor, () {
                                    setState(() {
                                      quantityAmount--;
                                      if (quantityAmount < 0)
                                        quantityAmount = 0;
                                    });
                                  }, FontAwesomeIcons.minus),
                                  Text(quantityAmount.toString()),
                                  quantityIcon(kSecondaryColor, (() {
                                    setState(() {
                                      quantityAmount++;
                                    });
                                  }), FontAwesomeIcons.plus)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: GridView.builder(
                            itemCount: data[0].products!.length,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.6,
                            ),
                            itemBuilder: ((context, index) {
                              return NutrienWidget(
                                product: data[0].products![index],
                                index: index,
                              );
                            })),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

