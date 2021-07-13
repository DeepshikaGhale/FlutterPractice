import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      // assert is added as a condition to test if the item has any null value.
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //listTile is used for representing single items in list
    return Card(
      child: ListTile(
        onTap: () {
          print('${item.name} pressed');
        },
        leading: Image.network(item.product_image),
        title: Text(item.name),
        subtitle: Text(item.brand),
        trailing: Text(
          '\$${item.price}',
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
