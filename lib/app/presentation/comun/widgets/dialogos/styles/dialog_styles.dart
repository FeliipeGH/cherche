
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getMaxAlertDialogWidth(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: double.infinity,
    tablet: 400,
  );
}

double getAlertDialogMarginX(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 12,
      normal: 16,
      large: 18,
      extraLarge: 20,
    ),
    tablet: 0,
  );
}

double getAlertDialogIconSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 28,
      normal: 36,
      large: 38,
      extraLarge: 44,
    ),
    tablet: 46,
  );
}

double getTitleDialogFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 22,
      normal: 28,
      large: 30,
      extraLarge: 32,
    ),
    tablet: 34,
  );
}

double getTextDialogFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 20,
      normal: 26,
      large: 28,
      extraLarge: 30,
    ),
    tablet: 28,
  );
}
