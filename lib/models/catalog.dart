import 'dart:convert';

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        label: 'Cleanser',
        brand: "Paula's Choice",
        name: "Skin Perfecting 2% BHA Liquid Exfoliant",
        price: 29.50,
        type:
            "['✔ Normal\\n', '✔ Oily\\n', '✔ Combination\\n', '✔ Dry\\n', '✔ Sensitive\\n']",
        image:
            "https://www.sephora.com/productimages/sku/s2421360-main-zoom.jpg?imwidth=315")
  ];
}

class Item {
  final int id;
  final String label;
  final String brand;
  final String name;
  final num price;
  final String type;
  final String image;

  Item({
    required this.id,
    required this.label,
    required this.brand,
    required this.name,
    required this.price,
    required this.type,
    required this.image,
  });

  //json decoder
//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//         id: map["id"],
//         label: map["Label"],
//         brand: map["brand"],
//         name: map["name"],
//         price: map["price"],
//         type: map["skin_type"],
//         image: map["product_image"]);
//   }
// //json encoder
//   toMap() => {
//         "id": id,
//         "Label": label,
//         "brand": brand,
//         "name": name,
//         "price": price,
//         "skin_type": type,
//         "product_image": image
//       };

  Item copyWith({
    int? id,
    String? label,
    String? brand,
    String? name,
    num? price,
    String? type,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      label: label ?? this.label,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      price: price ?? this.price,
      type: type ?? this.type,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'brand': brand,
      'name': name,
      'price': price,
      'type': type,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      label: map['label'],
      brand: map['brand'],
      name: map['name'],
      price: map['price'],
      type: map['type'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, label: $label, brand: $brand, name: $name, price: $price, type: $type, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.label == label &&
        other.brand == brand &&
        other.name == name &&
        other.price == price &&
        other.type == type &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        label.hashCode ^
        brand.hashCode ^
        name.hashCode ^
        price.hashCode ^
        type.hashCode ^
        image.hashCode;
  }
}
