import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //backing field for Catalog Model
  late CatalogModel _catalogModel;

  //to map items
  //Collection of Ids - store ids of each item
  final List<int> _itemIds = [];

  //get catalog to access the private attribute which i _catalogModel
  CatalogModel get catalogModel => _catalogModel;

  set catalogmodel(CatalogModel newCatalogModel) {
    assert(newCatalogModel != null);
    _catalogModel = newCatalogModel;
  }

  //Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(
      0.0, (totalValue, currentValue) => totalValue + currentValue.price);
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;

  AddMutation({required this.item});
  @override
  perform() {
    store!.cartModel._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;

  RemoveMutation({required this.item});
  @override
  perform() {
    store!.cartModel._itemIds.remove(item.id);
  }
}
