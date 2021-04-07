import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:flutter/material.dart';

class PaginaBienvenidaBloc extends ChangeNotifier {
  final AuntenticacionServicioInterface auntenticacionServicioInterface;

  PaginaBienvenidaBloc({this.auntenticacionServicioInterface});

  Future<bool> estaLogueado() async {
    await Future.delayed(const Duration(seconds: 3));
    return await this.auntenticacionServicioInterface.estaLogueado();
  }
}
