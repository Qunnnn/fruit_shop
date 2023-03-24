import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modules/dashboard/provider/cart_provider.dart';
import '../widgets/item_cart.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "My Cart",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<MyCart>(
              builder: ((context, value, child) => Expanded(
                    child: ListView.builder(
                        itemCount: value.getUserCard().length,
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ItemCart(
                                product: value.getUserCard()[index],
                              ),
                            ))),
                  ))),
        ),
      ),
    );
  }
}
