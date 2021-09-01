import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: MyTheme.lightgreen,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}"
                .text
                .xl
                .bold
                .color(Colors.green.shade700)
                .make(),
            Container(
                child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade900),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            )),
                        child: "Buy".text.make())
                    .wh(100, 40))
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
                color: MyTheme.lightgreen,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl.bold.make(),
                    Text(
                      catalog.Label,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade700),
                    ),
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
