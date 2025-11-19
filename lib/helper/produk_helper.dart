import 'package:http/http.dart' as http;
import 'dart:convert';

// function untuk mengambil data dari api
Future<void> ambilproduk() async {
  // siapkan url/endpoint
  var alamat = Uri.parse("https://fakestoreapi.com/products/4");

  print("Sedang mengambil data...");

  // error handling
  try {
    // blok perintah yang coba dijalankan
    //jika error lempar ke catcj
    var respon = await http.get(alamat);

    if (respon.statusCode == 200) {
      print("Ada respon dari server");
      var hasil = jsonDecode(respon.body);
      print(hasil["price"]);
      print(respon.body);
    } else {
      print("Tidak ada respon");
    }
  } catch (error) {
    print('Gagal : $error');
  }
}
