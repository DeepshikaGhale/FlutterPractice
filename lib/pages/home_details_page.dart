import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: context.cardColor),
      backgroundColor: context.cardColor, //to change color
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}"
                .text
                .xl
                .bold
                .color(Colors.green.shade700)
                .make(),
            Container(child: AddToCart(catalog: catalog).wh(120, 40))
          ],
        ).p12(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.product_image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 20,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.canvasColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl.bold.make(),
                    Text(
                      catalog.Label,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade700),
                    ),
                    "Aliquyam diam erat labore ipsum erat est lorem, magna sit ipsum voluptua erat gubergren sed lorem elitr, vero lorem elitr.Aliquyam diam erat labore ipsum erat est lorem, magna sit ipsum voluptua erat gubergren sed lorem elitr, vero lorem elitr."
                        .text
                        .make()
                  ],
                ).p32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
