import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/modulos/home/pagina_home.dart';
import 'package:cherche_transport_u/app/presentation/modulos/iniciar_sesion/iniciar_sesion.dart';
import 'package:cherche_transport_u/app/presentation/modulos/pagina_principal/pagina_bienvenida_bloc.dart';
import 'package:cherche_transport_u/app/presentation/tema/colores.dart';
import 'package:cherche_transport_u/external/responsive/builder/custom_responsive_builder.dart';
import 'package:cherche_transport_u/external/responsive/models/custom_sizing_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaginaBienvenida extends StatefulWidget {
  const PaginaBienvenida._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext actual) => PaginaBienvenidaBloc(
        auntenticacionServicioInterface:
            actual.read<AuntenticacionServicioInterface>(),
      ),
      builder: (_, __) => PaginaBienvenida._(),
    );
  }

  @override
  _PaginaBienvenidaState createState() => _PaginaBienvenidaState();
}

class _PaginaBienvenidaState extends State<PaginaBienvenida> {
  void _init() async {
    final PaginaBienvenidaBloc paginaBienvenidaBloc =
        context.read<PaginaBienvenidaBloc>();
    final bool estaLogueado = await paginaBienvenidaBloc.estaLogueado();
    if (estaLogueado) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => PaginaHome()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => IniciarSesion.init(context)));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DeviceOrientation> orientations = [];
    bool isMobile = true;
    return CustomResponsiveBuilder(builder:
        (BuildContext context, CustomSizingInformation sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet ||
          sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        orientations.add(DeviceOrientation.landscapeLeft);
        orientations.add(DeviceOrientation.landscapeRight);
        isMobile = false;
      } else {
        orientations.add(DeviceOrientation.portraitUp);
        orientations.add(DeviceOrientation.portraitDown);
      }
      // SystemChrome.setPreferredOrientations(orientations);
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColoresPrincipales.colorFondo,
          child: ZoomIn(
            child: Center(
              child: Container(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                      widthFactor: isMobile ? 0.8 : 0.5,
                      child: Image.asset("assets/logo_principalp.png"))),
            ),
          ),
        ),
      );
    });
  }
}
