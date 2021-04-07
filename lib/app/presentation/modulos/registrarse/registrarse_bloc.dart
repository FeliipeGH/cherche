import 'package:cherche_transport_u/app/data/dto/usuario_registrarse.dart';
import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/error_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/loading_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/warning_dialog.dart';
import 'package:cherche_transport_u/app/presentation/modulos/iniciar_sesion/iniciar_sesion.dart';
import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:flutter/material.dart';

class RegistrarseBloc extends ChangeNotifier {
  final AuntenticacionServicioInterface auntenticacionServicioInterface;
  final MaterialInputProvider materialInputProvider;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UsuarioRegistrarse usuarioRegistrarse = UsuarioRegistrarse();
  String repetirContra;

  RegistrarseBloc(
      {this.auntenticacionServicioInterface, this.materialInputProvider});

  void setRepetirContra(String value) => repetirContra = value;

  void registrarse(BuildContext context) async {
    if (!materialInputProvider.makeValidation) {
      materialInputProvider.setMakeValidation();
    }
    if (formKey.currentState.validate()) {
      if (repetirContra == usuarioRegistrarse.contraseniaR) {
        showLoadingDialog(context);
        try {
          await this
              .auntenticacionServicioInterface
              .registrarse(usuarioRegistrarse);
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => IniciarSesion.init(context)));
        } catch (e) {
          Navigator.pop(context);
          showErrorDialog(context, "El usuario ya existe");
        }
      } else {
        showWarningDialog(context, "Las contraseñas no coinciden");
      }
    }
  }
}
