
import 'package:flutter/material.dart';
import 'package:fruit_shop/Modules/dashboard/provider/cart_provider.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatefulWidget {
  Product product;
  ItemCart({required this.product});
  


  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {

  void removeItemFromCart(){
    Provider.of<MyCart>(context, listen: false).deleteItem(widget.product);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(offset: Offset(1, 2), color: Colors.grey)]),
      child: ListTile(
          leading: Image.asset(widget.product.image),
          title: Text(widget.product.name),
          subtitle: Text('\$'+widget.product.price),
          trailing: IconButton(onPressed: removeItemFromCart, icon: Icon(Icons.delete))
      ),
    );
  }
}
