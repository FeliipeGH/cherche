import 'package:cherche_transport_u/app/data/dto/usuario_login.dart';
import 'package:cherche_transport_u/app/data/dto/usuario_registrarse.dart';
import 'package:cherche_transport_u/app/domain/repositorios/autenticacion_repo_interface.dart';
import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/domain/servicios/local_servicio_interface.dart';

class AutenticacionServicio implements AuntenticacionServicioInterface {
  final AuntenticacionRepoInterface auntenticacionRepoInterface;
  final LocalServicioInterface localServicioInterface;

  AutenticacionServicio(
      {this.localServicioInterface, this.auntenticacionRepoInterface});

  @override
  Future<void> iniciarSesion(UsuarioLogin usuarioLogin, bool recuerdame) async {
    try {
      await this.auntenticacionRepoInterface.iniciarSesion(usuarioLogin);
      if (recuerdame) {
        this.localServicioInterface.guardarLogueo();
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> estaLogueado() async {
    bool esLogueado = await localServicioInterface.estaLogueado();
    if (esLogueado != null) {
      return esLogueado;
    }
    return false;
  }

  @override
  Future<void> registrarse(UsuarioRegistrarse usuarioRegistrarse) async {
    await auntenticacionRepoInterface.registrarse(usuarioRegistrarse);
  }
}
