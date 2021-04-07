
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getTextFontSize(BuildContext context) {
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
double getSubTextFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 14,
      normal: 16,
      large: 19,
      extraLarge: 20,
    ),
    tablet: getCustomValueForRefinedSize<double>(
      context: context,
      small: 22,
      normal: 22,
      large: 22,
      extraLarge: 22,
    ),
  );
}

double getSubTitleFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 18,
      normal: 20,
      large: 22,
      extraLarge: 24,
    ),
    tablet: getCustomValueForRefinedSize<double>(
      context: context,
      small: 24,
      normal: 24,
      large: 25,
      extraLarge: 26,
    ),
  );
}

double getHeadLineTitleFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 22,
      normal: 24,
      large: 26,
      extraLarge: 28,
    ),
    tablet: getCustomValueForRefinedSize<double>(
      context: context,
      small: 30,
      normal: 32,
      large: 34,
      extraLarge: 36,
    ),
  );
}
