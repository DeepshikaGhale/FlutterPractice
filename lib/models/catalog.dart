import 'dart:convert';

class CatalogModel {
  static late List<Item> items;

  //  to get item from id
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // get item by position
  static Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String Label;
  final String brand;
  final String name;
  final num price;
  final String skin_type;
  final String product_image;

  Item({
    required this.id,
    required this.Label,
    required this.brand,
    required this.name,
    required this.price,
    required this.skin_type,
    required this.product_image,
  });

//decoding json
//   factory Item.fromMap(Map<String, dynamic> map) => Item(
//       id: map["id"],
//       Label: map["Label"],
//       brand: map["brand"],
//       name: map["name"],
//       price: map["price"],
//       skin_type: map["skin_type"],
//       product_image: map["product_image"]);
// //encode
//   toMap() => {
//         "id": id,
//         "Label": Label,
//         "brand": brand,
//         "name": name,
//         "price": price,
//         "skin_type": skin_type,
//         "product_image": product_image
//       };

  Item copyWith({
    int? id,
    String? Label,
    String? brand,
    String? name,
    num? price,
    String? skin_type,
    String? product_image,
  }) {
    return Item(
      id: id ?? this.id,
      Label: Label ?? this.Label,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      price: price ?? this.price,
      skin_type: skin_type ?? this.skin_type,
      product_image: product_image ?? this.product_image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Label': Label,
      'brand': brand,
      'name': name,
      'price': price,
      'skin_type': skin_type,
      'product_image': product_image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      Label: map['Label'],
      brand: map['brand'],
      name: map['name'],
      price: map['price'],
      skin_type: map['skin_type'],
      product_image: map['product_image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, Label: $Label, brand: $brand, name: $name, price: $price, skin_type: $skin_type, product_image: $product_image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.Label == Label &&
        other.brand == brand &&
        other.name == name &&
        other.price == price &&
        other.skin_type == skin_type &&
        other.product_image == product_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        Label.hashCode ^
        brand.hashCode ^
        name.hashCode ^
        price.hashCode ^
        skin_type.hashCode ^
        product_image.hashCode;
  }
}
