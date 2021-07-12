//final makes the class ko attribute immutable,i.e. the value can be passed only
//through the construter

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);

  


}

