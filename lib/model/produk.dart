class Produk {
  // 1.definisi var yang dibutuhkan
  // 2.set ke final agar tidak dapat dirubah setelah dibuat
  final int id;
  final String title;
  final String decription;
  final double price;
  final String category;
  final String image;

// buat konstruktor
Produk({
  required this.id,
  required this.title,
  required this.decription,
  required this.price,
  required this.category,
  required this.image,
  });

//membuat method untuk import untuk dari json
//membuat method dengan keyword factory
factory Produk.darijson(Map<String,dynamic> json){
  return Produk(
  id: json["id"],
  title: json["title"],
  decription: json["decription"],
  price: json["price"],
  category: json["category"],
  image: json["image"]
  );
}
}
