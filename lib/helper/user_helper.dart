import 'dart:async';
import 'dart:convert';
import 'package:project_dart/model/user.dart';
import 'package:http/http.dart' as http;

class UserHelper {
  final Map<String, String> _header = {
    "Content-Type": "application/json"
  };

  // 🔹 Method Update User
  Future<User> updateUser(User v) async {
    var url = Uri.parse("https://fakestoreapi.com/users/${v.id}");
    try {
      var respon = await http.put(
        url,
        headers: _header,
        body: jsonEncode(v.toMap()),
      );

      // Biasanya update -> status code 200
      if (respon.statusCode == 200 || respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return User.fromMap(json);
      } else {
        throw Exception("Error status code: ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // 🔹 Method Mendapatkan Semua User
  Future<List<User>> getAllUsers() async {
    var url = Uri.parse("https://fakestoreapi.com/users");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        return jsonData.map((item) => User.fromMap(item)).toList();
      } else {
        throw Exception('Gagal memuat data pengguna. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }   

  // 🔹 Method Membuat User Baru
  Future<int> buatUser(User v) async {
    var url = Uri.parse("https://fakestoreapi.com/users");
    try {
      var respon = await http.post(
        url,
        headers: _header,
        body: jsonEncode(v.toMap()),
      );
      if (respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code: ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // 🔹 Method Mendapatkan User Berdasarkan ID
  Future<User> getUserById(int id) async {
    var url = Uri.parse("https://fakestoreapi.com/users/$id");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return User.fromMap(json);
      } else {
        throw Exception("Error koneksi status: ${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
