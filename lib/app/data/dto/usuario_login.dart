import 'dart:convert';

UsuarioLogin usuarioLoginFromJson(String str) =>
    UsuarioLogin.fromJson(json.decode(str));

String usuarioLoginToJson(UsuarioLogin data) => json.encode(data.toJson());

class UsuarioLogin {
  UsuarioLogin({
    this.correo,
    this.contrasenia,
  });

  String correo;
  String contrasenia;

  factory UsuarioLogin.fromJson(Map<String, dynamic> json) => UsuarioLogin(
        correo: json["correo"],
        contrasenia: json["contrasenia"],
      );

  void setCorreo(String value) => correo = value;

  void setContra(String value) => contrasenia = value;

  // todo change opcion
  Map<String, dynamic> toJson() => {
        "correo": correo,
        "contrasenia": contrasenia,
        "opcion": 0,
      };
}
