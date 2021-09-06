import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart_list.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/6135dcde470d332594033848";

  @override
  //to give the data to the build method.
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final productsJson =
        await rootBundle.loadString("assets/files/products.json");

    // final response = await http.get(Uri.parse(url));
    // final productsJson = response.body;

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

    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          builder: (context, _, status) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Colors.red,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white)),
          mutations: {AddMutation, RemoveMutation},
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered()
              ],
            ),
          ),
        ));
  }
}
