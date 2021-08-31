import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //to give the data to the build method.
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final productsJson =
        await rootBundle.loadString("assets/files/products.json");
    final decodeData = jsonDecode(productsJson);
    var productsdata = decodeData['products'];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //String name = 'Deepshika Ghale';
    //the 50 is the amount of item getting displayed over the screen

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ?
            // ListView.builder(
            //   //here the builder renders the items shown on the screen
            //   itemCount: CatalogModel.items.length,
            //   itemBuilder: (context, index)
            //     //here index means the number position like in an array
            //     => ItemWidget(
            //       item: CatalogModel.items[index],
            //     )
            //   ,
            // )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GridTile(
                        header: Container(
                        child: Text(item.name, style:  TextStyle(color: Colors.white),),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green
                        ),),
                        child: Image.network(item.product_image),
                        footer: Text(
                          "\$${item.price.toString()}",
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
