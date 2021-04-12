import 'package:cherche_transport_u/app/presentation/comun/auth/auth_main_content.dart';
import 'package:cherche_transport_u/app/presentation/comun/auth/styles.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ContenedorAutenticador extends StatelessWidget {
  final String titulo, subtitulo, presubtitulo;
  final Widget hijo;
  final Function onClic;

  ContenedorAutenticador(
      {this.titulo, this.subtitulo, this.presubtitulo, this.hijo, this.onClic});

  @override
  Widget build(BuildContext context) {
    final Size size =
        MediaQuery.of(context).size; // tamanio del equipo den sus medidas
    //lienzo principal
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: getWaveHeight(context),
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.white70,
                      Colors.white54,
                      Colors.white30,
                      Colors.white24,
                    ],
                    durations: [32000, 21000, 18000, 5000],
                    heightPercentages: [0.25, 0.26, 0.28, 0.31],
                  ),
                  waveAmplitude: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  size: Size(double.infinity, double.infinity),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getTopSeparation(context)),
                child: AuthMainContent(
                  hijo: hijo,
                  onClic: onClic,
                  presubtitulo: presubtitulo,
                  subtitulo: subtitulo,
                  titulo: titulo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
