import 'dart:convert';

class RegisterModel {
  final String name;
  final DateTime tglLahir;
  final String username;
  final String password;
  final String idRole;

  RegisterModel({
    required this.name,
    required this.tglLahir,
    required this.username,
    required this.password,
    required this.idRole,
  });

  factory RegisterModel.fromRawJson(String str) =>
      RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        username: json["username"],
        password: json["password"],
        idRole: json["id_role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "username": username,
        "password": password,
        "id_role": idRole,
      };
}
