import 'dart:convert';

UsuarioRegistrarse usuarioRegistrarseFromJson(String str) =>
    UsuarioRegistrarse.fromJson(json.decode(str));

String usuarioRegistrarseToJson(UsuarioRegistrarse data) =>
    json.encode(data.toJson());

class UsuarioRegistrarse {
  UsuarioRegistrarse({
    this.correoR,
    this.contraseniaR,
    this.nomPersonaR = "",
    this.aPaternoR = "",
    this.aMaternoR = "",
    this.fechaNr = "",
    this.generoR = "",
  });

  String correoR;
  String contraseniaR;
  String nomPersonaR;
  String aPaternoR;
  String aMaternoR;
  String fechaNr;
  String generoR;

  factory UsuarioRegistrarse.fromJson(Map<String, dynamic> json) =>
      UsuarioRegistrarse(
        correoR: json["correoR"],
        contraseniaR: json["contraseniaR"],
        nomPersonaR: json["nomPersonaR"],
        aPaternoR: json["aPaternoR"],
        aMaternoR: json["aMaternoR"],
        fechaNr: json["fechaNR"],
        generoR: json["generoR"],
      );

  Map<String, dynamic> toJson() => {
        "correoR": correoR,
        "contraseniaR": contraseniaR,
        "nomPersonaR": nomPersonaR,
        "aPaternoR": aPaternoR,
        "aMaternoR": aMaternoR,
        "fechaNR": fechaNr,
        "generoR": generoR,
        "opcion": 1,
      };

  void setCorreoR(String value) => correoR = value;

  void setContra(String value) => contraseniaR = value;
}
