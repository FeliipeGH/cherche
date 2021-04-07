abstract class LocalRepoInterface {
  Future<bool> estaLogueado();

  Future<bool> guardarEstarLogueado();

  Future<void> removerEstarLogueado();
}
