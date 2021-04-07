
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getButtonFontSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 17,
      normal: 18,
      large: 19,
      extraLarge: 20,
    ),
    tablet: 21,
  );
}

double getPaddingButton(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 14,
      normal: 15,
      large: 16,
      extraLarge: 16,
    ),
    tablet: 16,
  );
}
