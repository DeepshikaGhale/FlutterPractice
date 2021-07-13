class CatalogModel {
  static final items = [
  Item(
      id: 1,
      Label: 'Cleanser',
      brand: "Paula's Choice",
      name: "Skin Perfecting 2% BHA Liquid Exfoliant",
      price: 29.50,
      skin_type:
          "['✔ Normal\\n', '✔ Oily\\n', '✔ Combination\\n', '✔ Dry\\n', '✔ Sensitive\\n']",
      product_image:
          "https://www.sephora.com/productimages/sku/s2421360-main-zoom.jpg?imwidth=315")
];
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
}
