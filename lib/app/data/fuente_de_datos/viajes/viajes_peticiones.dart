import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void solicitarColectivos(BuildContext context) async {
  Dio dio = context.read<Dio>();
  // get
  Response response = await dio.get(
    "ruta",
  );
  // post
  //     Response response = await dio.post(IniciarSesionContantes.AUTH,
  //         data: usuarioLoginToJson(usuarioLogin));
}
