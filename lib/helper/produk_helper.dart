import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = "https://fakestoreapi.com/products";


//  GET : Ambil semua produk

Future<void> getAllProducts() async {
  print("Mengambil semua produk...");

  try {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("BERHASIL AMBIL SEMUA PRODUK");
      List data = jsonDecode(response.body);

      for (var item in data) {
        print("ID: ${item['id']} - ${item['title']}");
      }

    } else {
      print("Gagal: Status ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}


//  POST : Tambah produk baru

Future<void> addNewProduct() async {
  print("Menambahkan produk baru...");

  try {
    var url = Uri.parse(baseUrl);

    var body = jsonEncode({
      "title": "Acuk baru ",
      "price": 100000,
      "description": "Produk baru dari negara Masmawais",
      "image": "https://i.pravatar.cc",
      "category": "clothing"
    });

    var response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("BERHASIL TAMBAH PRODUK");
      print(response.body);
    } else {
      print("Gagal: Status ${response.statusCode}");
    }

  } catch (e) {
    print("Error: $e");
  }
}


//  GET : Ambil 1 produk berdasarkan id
Future<void> getSingleProduct(int id) async {
  print("Mengambil produk id $id...");

  try {
    var url = Uri.parse("$baseUrl/$id");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("BERHASIL AMBIL PRODUK");
      var data = jsonDecode(response.body);

      print("ID: ${data['id']}");
      print("Title: ${data['title']}");
      print("Price: ${data['price']}");
      print("Category: ${data['category']}");
      print("Description: ${data['description']}");
      print("Image: ${data['image']}");

    } else {
      print("Gagal: Status ${response.statusCode}");
    }

  } catch (e) {
    print("Error: $e");
  }
}


//  Update produk berdasarkan id
Future<void> updateProduct(int id) async {
  print("Mengupdate produk id $id...");

  try {
    var url = Uri.parse("$baseUrl/$id");

    var body = jsonEncode({
      "title": "Produk Update Flutter",
      "price": 88.88,
      "description": "Produk berhasil di-update",
      "image": "https://i.pravatar.cc",
      "category": "updated-product"
    });

    var response = await http.put(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print("BERHASIL UPDATE PRODUK");
      print(response.body);
    } else {
      print("Gagal: Status ${response.statusCode}");
    }

  } catch (e) {
    print("Error: $e");
  }
}