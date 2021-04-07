import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getFontSizeButton(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize(
      context: context,
      small: 15.5,
      normal: 16,
      large: 17,
      extraLarge: 18,
    ),
    tablet: 17,
  );
}

double getFontSizeLittleButton(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize(
      context: context,
      small: 14.8,
      normal: 16,
      large: 17,
      extraLarge: 18,
    ),
    tablet: 17,
  );
}
