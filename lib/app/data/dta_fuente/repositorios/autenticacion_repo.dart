import 'package:cherche_transport_u/app/data/constantes/http/iniciar_sesion.dart';
import 'package:cherche_transport_u/app/data/dto/usuario_login.dart';
import 'package:cherche_transport_u/app/data/dto/usuario_registrarse.dart';
import 'package:cherche_transport_u/app/domain/repositorios/autenticacion_repo_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AutenticacionRepo implements AuntenticacionRepoInterface {
  final Dio dio;

  AutenticacionRepo({@required this.dio});

  @override
  Future<void> iniciarSesion(UsuarioLogin usuarioLogin) async {
    Response response = await dio.post(IniciarSesionContantes.AUTH,
        data: usuarioLoginToJson(usuarioLogin));
    if (response.data == "no") {
      throw new Exception();
    }
  }

  @override
  Future<void> registrarse(UsuarioRegistrarse usuarioRegistrarse) async {
    Response response = await dio.post(IniciarSesionContantes.AUTH,
        data: usuarioRegistrarseToJson(usuarioRegistrarse));
    if (response.data == "no") {
      throw new Exception();
    }
  }
}
