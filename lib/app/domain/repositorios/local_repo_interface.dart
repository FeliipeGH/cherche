abstract class LocalRepoInterface {
  Future<bool> estaLogueado();

  Future<void> guardarEstarLogueado();

  Future<void> removerEstarLogueado();
}
