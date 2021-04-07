import 'package:cherche_transport_u/app/presentation/comun/auth/styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/modulos/iniciar_sesion/estilos/estilos_autenticador.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

class AuthMainContent extends StatelessWidget {
  final String titulo, subtitulo, presubtitulo;
  final Widget hijo;
  final Function onClic;

  const AuthMainContent(
      {Key key,
      this.titulo,
      this.subtitulo,
      this.presubtitulo,
      this.hijo,
      this.onClic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: getImageSize(context),
              margin: EdgeInsets.symmetric(
                  horizontal: obtenerMargenX(context), vertical: 12),
              child: Image.asset('assets/logo_principalp.png'),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(titulo,
                  style: MainTypography.tittleApp
                      .copyWith(fontSize: getHeadLineTitleFontSize(context))),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: FittedBox(
                      child: Text(presubtitulo,
                          style: MainTypography.subtitleTextStyle.copyWith(
                              fontSize: getSubTitleFontSize(context))),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      child: TextButton(
                        child: Text(subtitulo,
                            style: MainTypography.subtitleTextStyle.copyWith(
                                fontSize: getSubTextFontSize(context))),
                        onPressed: onClic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getMarginX(context)),
              constraints: BoxConstraints(
                  maxWidth: getCustomValueForScreenType(
                      context: context, mobile: double.infinity, tablet: 520)),
              child: hijo,
            )
          ],
        ),
      ),
    );
  }
}
