import 'package:cherche_transport_u/app/data/constantes/local_storage.dart';
import 'package:cherche_transport_u/app/domain/repositorios/local_repo_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo implements LocalRepoInterface {
  @override
  Future<bool> estaLogueado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(LocalStorage.ES_LOGUEADO);
  }

  @override
  Future<bool> guardarEstarLogueado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(LocalStorage.ES_LOGUEADO, true);
  }

  @override
  Future<void> removerEstarLogueado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
