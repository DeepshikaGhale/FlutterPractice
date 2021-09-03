import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_list.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool IsInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
            onPressed: () {
              if (!IsInCart) {
                IsInCart = IsInCart.toggle();
                final _catalogModel = CatalogModel();
                _cart.catalogmodel = _catalogModel;
                _cart.add(widget.catalog);
                setState(() {});
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade900),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: IsInCart
                ? Icon(Icons.done)
                : Icon(CupertinoIcons.cart_badge_plus))
        .w40(context);
  }
}
