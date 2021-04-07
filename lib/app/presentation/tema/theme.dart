import 'package:cherche_transport_u/app/presentation/tema/colores.dart';
import 'package:flutter/material.dart';


ThemeData themeData() {
  final ThemeData base = ThemeData.light();
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: Color(0xffECEEF2),
    filled: true,
  );

  return base.copyWith(
    dividerColor: Color(0xFFECEDF1),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    inputDecorationTheme: inputDecorationTheme,
    brightness: Brightness.light,
    backgroundColor: Color(0xFFF2F3F8),
    cardColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColoresPrincipales.COLOR_PRINCIPAL),
    )),
    // todo change
    primaryColor: ColoresPrincipales.COLOR_PRINCIPAL,
    accentColor: ColoresPrincipales.COLOR_SECUNDARIO,
    // todo change
    indicatorColor: ColoresPrincipales.COLOR_SECUNDARIO,
    buttonTheme: ButtonThemeData(
      buttonColor: ColoresPrincipales.COLOR_TERCIARIO,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
