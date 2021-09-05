import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_list.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

 
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool IsInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
            onPressed: () {
              if (!IsInCart) {
                IsInCart = IsInCart.toggle();
                final _catalogModel = CatalogModel();
                _cart.catalogmodel = _catalogModel;
                _cart.add(catalog);
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
