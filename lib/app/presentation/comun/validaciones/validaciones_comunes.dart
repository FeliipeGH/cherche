String validateCommonInput(String value) {
  if (value.length < 3) {
    return "Ingrese el campo solicitado";
  }
  return null;
}

String validatePassword(String value) {
  final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
  if (!regex.hasMatch(value)) {
    return "Ingrese una contraseña valida";
  }
  return null;
}

String validateEmail(String value) {
  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regex.hasMatch(value)) {
    return "Ingrese un correo valido";
  }
  return null;
}

String validateSignUpCode(String code) {
  if (code.length != 5) return "Ingrese el código";
  return null;
}
