import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getContentPageMarginX(BuildContext context) {
  return getCustomValueForScreenType(
    context: context,
    tablet: 12,
    mobile: getCustomValueForRefinedSize(
      context: context,
      small: 10,
      normal: 12,
      large: 14,
      extraLarge: 16,
    ),
  );
}

double getTitleAppFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 17,
      normal: 20,
      large: 23,
      extraLarge: 24,
    ),
    tablet: 26,
  );
}

double getTitleIconSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 25,
      normal: 30,
      large: 32,
      extraLarge: 33,
    ),
    tablet: 35,
  );
}

