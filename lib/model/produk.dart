class Produk {
  // 1. definisi variable
  final int id;
  final String title;
  final String description;   // diperbaiki
  final double price;
  final String category;
  final String image;

  // 2. constructor
  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  // 3. factory untuk parsing JSON
  factory Produk.dariJson(Map<String, dynamic> json) {
    return Produk(
      id: json["id"],
      title: json["title"],
      description: json["description"],   // perbaikan di sini
      price: (json["price"] as num).toDouble(), // aman jika int/double
      category: json["category"],
      image: json["image"],
    );
  }

  // 4. method untuk convert ke JSON (opsional, berguna untuk POST/PUT)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "category": category,
      "image": image,
    };
  }
}