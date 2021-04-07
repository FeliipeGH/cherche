import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

double getImageSize(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 60,
      normal: 65,
      large: 75,
      extraLarge: 85,
    ),
    tablet: 100,
  );
}

double getWaveHeight(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 180,
      normal: 210,
      large: 270,
      extraLarge: 280,
    ),
    tablet: 300,
  );
}

double getTopSeparation(BuildContext context) {
  return getCustomValueForScreenType<double>(
    context: context,
    mobile: getCustomValueForRefinedSize<double>(
      context: context,
      small: 82,
      normal: 95,
      large: 130,
      extraLarge: 130,
    ),
    tablet: 150,
  );
}


