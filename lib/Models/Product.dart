class Product {
  int id;
  int groupId;
  String name;
  double rating;
  double price;
  String imageUrl;

  Product(
      {required this.id,
      required this.groupId,
      required this.name,
      required this.rating,
      required this.price,
      required this.imageUrl});

  static Product GetFromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        groupId: json["groupId"],
        name: json["name"],
        rating: json["rating"],
        price: json["price"],
        imageUrl: json["imageUrl"]);
  }
}
