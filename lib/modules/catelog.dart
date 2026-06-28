class CatalogModel {
  static final List<Items> products = [
    Items(
      id: "1",
      name: "iPhone 12",
      desc: "Apple iPhone 12 with A14 Bionic chip",
      price: 999.99,
      color: "Black",
      image: "https://picsum.photos/seed/iphone/200/200",
    ),
    Items(
      id: "2",
      name: "Samsung Galaxy S21",
      desc: "Samsung Galaxy S21 with Exynos 2100",
      price: 799.99,
      color: "Silver",
      image: "https://picsum.photos/seed/samsung/200/200",
    ),
    Items(
      id: "3",
      name: "Google Pixel 5",
      desc: "Google Pixel 5 with Snapdragon 765G",
      price: 699.99,
      color: "Green",
      image: "https://picsum.photos/seed/google/200/200",
    ),
    Items(
      id: "4",
      name: "OnePlus 9",
      desc: "OnePlus 9 with Snapdragon 888",
      price: 729.99,
      color: "Blue",
      image: "https://picsum.photos/seed/oneplus/200/200",
    ),
    Items(
      id: "5",
      name: "Sony Xperia 1 II",
      desc: "Sony Xperia 1 II with Snapdragon 865",
      price: 1199.99,
      color: "Purple",
      image: "https://picsum.photos/seed/sony/200/200",
    ),
    Items(
      id: "6",
      name: "LG Velvet",
      desc: "LG Velvet with Snapdragon 765G",
      price: 599.99,
      color: "Red",
      image: "https://picsum.photos/seed/lg/200/200",
    ),
  ];
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
}
