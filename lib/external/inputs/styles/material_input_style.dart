
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getMaterialInputIconSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 24,
      normal: 26,
      large: 28,
      extraLarge: 30,
    ),
    tablet: 32,
  );
}

double getInputTextFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 16,
      normal: 18,
      large: 21,
      extraLarge: 22,
    ),
    tablet: getCustomValueForRefinedSize<double>(
      context: context,
      small: 24,
      normal: 24,
      large: 21,
      extraLarge: 22,
    ),
  );
}

double getErrorTextFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 14,
      normal: 16,
      large: 18,
      extraLarge: 20,
    ),
    tablet: 21,
  );
}