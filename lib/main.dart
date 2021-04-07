import 'dart:io';

import 'package:cherche_transport_u/app/data/dta_fuente/repositorios/autenticacion_repo.dart';
import 'package:cherche_transport_u/app/data/dta_fuente/repositorios/local_repo.dart';
import 'package:cherche_transport_u/app/data/dta_fuente/sirvicios/autenticacion_servicio.dart';
import 'package:cherche_transport_u/app/data/dta_fuente/sirvicios/local_servicio.dart';
import 'package:cherche_transport_u/app/domain/repositorios/autenticacion_repo_interface.dart';
import 'package:cherche_transport_u/app/domain/repositorios/local_repo_interface.dart';
import 'package:cherche_transport_u/app/domain/servicios/autenticacion_servicio_interface.dart';
import 'package:cherche_transport_u/app/domain/servicios/local_servicio_interface.dart';
import 'package:cherche_transport_u/app/presentation/modulos/pagina_principal/pagina_bienvenida.dart';
import 'package:cherche_transport_u/app/presentation/tema/theme.dart';
import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const serverIp = "http://192.168.0.2/server";

/*void main() {
  runApp(Principal());
}*/

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => Principal(), // Wrap your app
      ),
    );

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MaterialInputProvider()),
        Provider<Dio>(
          create: (_) => Dio(BaseOptions(
            baseUrl: serverIp,
            headers: {
              HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
            },
          )),
        ),
        Provider<AuntenticacionRepoInterface>(
            create: (BuildContext acutal) =>
                AutenticacionRepo(dio: acutal.read<Dio>())),
        Provider<LocalRepoInterface>(create: (_) => LocalRepo()),
        Provider<LocalServicioInterface>(
            create: (BuildContext actual) => LocalServicio(
                localRepoInterface: actual.read<LocalRepoInterface>())),

        Provider<AuntenticacionServicioInterface>(
            create: (BuildContext contextActual) => AutenticacionServicio(
                  auntenticacionRepoInterface:
                      contextActual.read<AuntenticacionRepoInterface>(),
                  localServicioInterface:
                      contextActual.read<LocalServicioInterface>(),
                )),
      ],
      builder: (BuildContext buildContext, Widget widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // require by device preview
          locale: DevicePreview.locale(context), // Add the locale here
          // require by device preview
          builder: DevicePreview.appBuilder, // Add the builder here
          title: 'Cherche Transport',
          home: PaginaBienvenida.init(context),
          theme: themeData(),
        );
      },
    );
  }
}
