import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/constants/app_constants.dart';
import 'package:fruit_shop/utils/utils.dart';
import 'package:fruit_shop/widgets/nutrient_widget.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../data/data.dart';
import 'dart:math' as math;

import '../provider/cart_provider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantityAmount = 1;
  double sum = 0;
  void addItem(Product indivialProduct) {
    Provider.of<MyCart>(context, listen: false).addItemToCard(indivialProduct);

    showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your cart'),
            )));
  }

  @override
  void initState() {
    sum = double.parse(widget.product.price) * quantityAmount;
  }

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
                                Navigator.pop(context, sum);
                              },
                              child: IconWidget(
                                  FontAwesomeIcons.arrowLeft, false)),
                          const Text(
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
              child: Stack(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
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
                                        sum =
                                            double.parse(widget.product.price) *
                                                quantityAmount;
                                      });
                                    }, FontAwesomeIcons.minus),
                                    Text(quantityAmount.toString()),
                                    quantityIcon(kSecondaryColor, (() {
                                      setState(() {
                                        quantityAmount++;
                                        sum =
                                            double.parse(widget.product.price) *
                                                quantityAmount;
                                      });
                                    }), FontAwesomeIcons.plus)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: GridView.builder(
                              itemCount: data[0].products!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                Positioned(
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: SlideAction(
                      height: 60,
                      outerColor: kPrimaryColor,
                      sliderButtonIcon: const Icon(
                        Icons.arrow_forward,
                        color: kPrimaryColor,
                        size: 15,
                      ),
                      text: 'ADD TO CART - \$' + sum.toStringAsFixed(2),
                      textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      onSubmit: () => addItem(widget.product),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
