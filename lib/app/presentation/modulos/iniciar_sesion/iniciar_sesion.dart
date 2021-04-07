import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/comun/auth/conte_auten.dart';
import 'package:cherche_transport_u/app/presentation/comun/validaciones/validaciones_comunes.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/check_box/checkbox.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/buttons_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/modulos/iniciar_sesion/iniciar_sesion_bloc.dart';
import 'package:cherche_transport_u/app/presentation/modulos/registrarse/registrarse.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/inputs/material_input.dart';
import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IniciarSesion extends StatelessWidget {
  const IniciarSesion._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IniciarSesionBloc(
          auntenticacionServicioInterface:
              context.read<AuntenticacionServicioInterface>(),
          materialInputProvider: context.read<MaterialInputProvider>()),
      builder: (_, __) => IniciarSesion._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final IniciarSesionBloc iniciarSesionBloc =
        Provider.of<IniciarSesionBloc>(context, listen: false);
    iniciarSesionBloc.materialInputProvider.setNotMakeValidation();
    return ContenedorAutenticador(
      titulo: 'Iniciar Sesion',
      subtitulo: 'Registrarse',
      presubtitulo: 'No tienes cuenta?',
      onClic: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext contextoActual) =>
                RegistrarUs.init(contextoActual)));
      },
      hijo: Container(
        child: Form(
          key: iniciarSesionBloc.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              MaterialInput(
                dataString: iniciarSesionBloc.usuarioLogin.correo,
                validation: validateEmail,
                icon: Icons.email,
                textInputType: TextInputType.emailAddress,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: 'Correo',
                labelText: 'Ingrese correo',
                helperText: 'Ingrese el correo',
                onChanged: iniciarSesionBloc.usuarioLogin.setCorreo,
              ),
              MaterialInput(
                dataString: iniciarSesionBloc.usuarioLogin.contrasenia,
                validation: validatePassword,
                isPassword: true,
                icon: Icons.lock,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: 'Contraseña',
                labelText: 'Ingrese contraseña',
                helperText: 'Ingrese la contraseña',
                onChanged: iniciarSesionBloc.usuarioLogin.setContra,
              ),
              SizedBox(height: 12),
              CustomCheckBox(
                title: "Recuerdáme",
                onChange: iniciarSesionBloc.cambiarRecuerdame,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: getPaddingButton(context))),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                          onPressed: () =>
                              iniciarSesionBloc.iniciarSesion(context),
                          child: Text(
                            'Iniciar',
                            style: MainTypography.buttonTextStyle
                                .copyWith(fontSize: getButtonFontSize(context)),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
