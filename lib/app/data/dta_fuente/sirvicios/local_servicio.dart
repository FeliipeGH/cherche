import 'package:cherche_transport_u/app/domain/repositorios/local_repo_interface.dart';
import 'package:cherche_transport_u/app/domain/servicios/local_servicio_interface.dart';

class LocalServicio implements LocalServicioInterface {
  final LocalRepoInterface localRepoInterface;

  LocalServicio({this.localRepoInterface});

  @override
  Future<bool> estaLogueado() async {
    return await localRepoInterface.estaLogueado();
  }

  @override
  Future<void> guardarLogueo() async {
    await this.localRepoInterface.guardarEstarLogueado();
  }
}
