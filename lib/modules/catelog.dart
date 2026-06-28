class CatalogModel {
  static List<Items> products = [];
}

class Items {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String color;
  final String image;

  const Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"].toString(),
      name: map["name"].toString(),
      desc: map["desc"].toString(),
      price: (map["price"] as num).toDouble(),
      color: map["color"].toString(),
      image: map["image"].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "price": price,
      "color": color,
      "image": image,
    };
  }
}
