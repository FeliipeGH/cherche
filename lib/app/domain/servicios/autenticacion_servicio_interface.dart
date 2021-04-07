import 'package:cherche_transport_u/app/data/dto/usuario_login.dart';
import 'package:cherche_transport_u/app/data/dto/usuario_registrarse.dart';

abstract class AuntenticacionServicioInterface {
  Future<void> iniciarSesion(UsuarioLogin usuarioLogin, bool recuerdame);

  Future<bool> estaLogueado();

  Future<void> registrarse(UsuarioRegistrarse usuarioRegistrarse);
}
