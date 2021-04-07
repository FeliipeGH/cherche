import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double obtenerMargenX(BuildContext context) {
  return getCustomValueForScreenType(context: context, mobile: 12, tablet: 0);
}

double obtenerAlturaY(BuildContext context) {
  final Size size =
      MediaQuery.of(context).size; // tamanio del equipo den sus medidas

  return getCustomValueForScreenType(
      context: context,
      mobile: getCustomValueForRefinedSize(
        context: context,
        small: size.height * 0.05,
        large: size.height * 0.12,
        normal: size.height * 0.15,
        extraLarge: size.height * 0.15,
      ),
      tablet: size.height * 0.05);
}

double getMarginX(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 12,
      normal: 16,
      large: 16,
      extraLarge: 24,
    ),
    tablet: 0,
  );
}
