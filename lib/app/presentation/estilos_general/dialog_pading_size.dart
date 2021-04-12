
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getDialogPaddingSize(BuildContext context){
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 8,
      normal: 12,
      large: 12,
      extraLarge: 12,
    ),
    tablet: 56,
  );
}
double getMainAppDialogPaddingSize(BuildContext context){
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 8,
      normal: 12,
      large: 12,
      extraLarge: 12,
    ),
    tablet: 16,
  );
}