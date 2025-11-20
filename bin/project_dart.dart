import 'package:project_dart/model/user.dart';
import 'package:project_dart/helper/user_helper.dart';
import 'package:project_dart/model/produk.dart';
import 'package:project_dart/helper/produk_helper.dart';

Future<void> main(List<String> arguments) async {
  print("Sedang Mengambil Data...........................................");

  // // 🔹 Ambil user dari API
  // User pengguna = await UserHelper().getUserById(2);
  // print("Username: ${pengguna.username}");
  // print("Email: ${pengguna.email}");

  // // 🔹 Membuat user baru
  // User v = User(
  //   id: 10,
  //   username: "isal",
  //   email: "isal@gmail.com",
  //   password: "1234",
  // );

  // // Kirim data ke endpoint
  // int idUserBaru = await UserHelper().buatUser(v);
  // print("ID user baru: $idUserBaru");

  // // 🔹 Mengupdate user
  // User up = User(
  //   id: 2,
  //   username: "mumu",
  //   email: "mama88@gmail.com",
  //   password: "2332",
  // );

  // // Panggil method updateUser()
  // User hasil = await UserHelper().updateUser(up);

  // // Tampilkan hasil update
  // print("Data user berhasil diupdate:");
  // print("Username: ${hasil.username}");
  // print("Email: ${hasil.email}");
   // Cek semua produk
  // await getAllProducts();

  // //  Cek 1 produk
   //await getSingleProduct(3);

  // //  Tambah produk
   await addNewProduct();

  // //  Update produk
  //  await updateProduct(1);
}
