import 'package:cherche_transport_u/app/data/dto/usuario_login.dart';
import 'package:cherche_transport_u/app/data/dto/usuario_registrarse.dart';

abstract class AuntenticacionRepoInterface {
  Future<void> iniciarSesion(UsuarioLogin usuarioLogin);

  Future<void> registrarse(UsuarioRegistrarse usuarioRegistrarse);
}
