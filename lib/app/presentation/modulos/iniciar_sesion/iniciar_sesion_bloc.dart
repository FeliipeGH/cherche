import 'package:cherche_transport_u/app/data/dto/usuario_login.dart';
import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/error_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/loading_dialog.dart';
import 'package:cherche_transport_u/app/presentation/modulos/home/pagina_home.dart';
import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:flutter/material.dart';

class IniciarSesionBloc extends ChangeNotifier {
  final AuntenticacionServicioInterface auntenticacionServicioInterface;
  final MaterialInputProvider materialInputProvider;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UsuarioLogin usuarioLogin = UsuarioLogin();
  bool recuerdame = false;

  IniciarSesionBloc(
      {this.materialInputProvider, this.auntenticacionServicioInterface});

  void iniciarSesion(BuildContext context) async {
    if (!materialInputProvider.makeValidation) {
      materialInputProvider.setMakeValidation();
    }
    if (formKey.currentState.validate()) {
      showLoadingDialog(context);
      try {
        await this
            .auntenticacionServicioInterface
            .iniciarSesion(usuarioLogin, recuerdame);
        Navigator.pop(context);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => PaginaHome()));
      } catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, "Datos incorrectos");
      }
    }
  }

  void cambiarRecuerdame(bool value) => recuerdame = value;
}
