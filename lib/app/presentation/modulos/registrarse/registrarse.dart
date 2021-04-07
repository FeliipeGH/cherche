import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/comun/auth/conte_auten.dart';
import 'package:cherche_transport_u/app/presentation/comun/validaciones/validaciones_comunes.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/modulos/iniciar_sesion/estilos/estilos_autenticador.dart';
import 'package:cherche_transport_u/app/presentation/modulos/registrarse/registrarse_bloc.dart';
import 'package:cherche_transport_u/external/inputs/material_input.dart';
import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrarUs extends StatelessWidget {
  const RegistrarUs._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext actual) => RegistrarseBloc(
        materialInputProvider: actual.read<MaterialInputProvider>(),
        auntenticacionServicioInterface:
            actual.read<AuntenticacionServicioInterface>(),
      ),
      builder: (_, __) => RegistrarUs._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RegistrarseBloc registrarseBloc =
        Provider.of<RegistrarseBloc>(context, listen: false);
    registrarseBloc.materialInputProvider.setNotMakeValidation();
    return ContenedorAutenticador(
      titulo: 'Registrarse',
      subtitulo: 'Iniciar Sesion',
      presubtitulo: 'Ya tienes cuenta',
      onClic: () {
        Navigator.of(context).pop();
      },
      hijo: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getMarginX(context)),
        constraints: BoxConstraints(
            maxHeight: getCustomValueForScreenType(
                context: context, mobile: double.infinity, tablet: 750)),
        child: Form(
          key: registrarseBloc.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              MaterialInput(
                dataString: registrarseBloc.usuarioRegistrarse.correoR,
                icon: Icons.email,
                validation: validateEmail,
                textInputType: TextInputType.emailAddress,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: 'Correo',
                labelText: ' correo',
                helperText: 'Ingrese el correo',
                onChanged: registrarseBloc.usuarioRegistrarse.setCorreoR,
              ),
              MaterialInput(
                dataString: registrarseBloc.usuarioRegistrarse.contraseniaR,
                isPassword: true,
                validation: validatePassword,
                icon: Icons.lock,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: 'Contraseña',
                labelText: 'Ingrese contraseña',
                helperText: 'Ingrese la contraseña',
                onChanged: registrarseBloc.usuarioRegistrarse.setContra,
              ),
              MaterialInput(
                dataString: registrarseBloc.repetirContra,
                icon: Icons.lock,
                isPassword: true,
                validation: validatePassword,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: 'Contraseña',
                labelText: 'Repetir contraseña',
                helperText: 'Repetir la contraseña',
                onChanged: registrarseBloc.setRepetirContra,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => registrarseBloc.registrarse(context),
                          child: Text('Registrarse'))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
