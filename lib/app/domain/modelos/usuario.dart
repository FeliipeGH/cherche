import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.correo,
    this.nombre,
    this.aPaterno,
    this.aMaterno,
  });

  String correo;
  String nombre;
  String aPaterno;
  String aMaterno;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    correo: json["correo"],
    nombre: json["nombre"],
    aPaterno: json["aPaterno"],
    aMaterno: json["aMaterno"],
  );

  Map<String, dynamic> toJson() => {
    "correo": correo,
    "nombre": nombre,
    "aPaterno": aPaterno,
    "aMaterno": aMaterno,
  };
}





