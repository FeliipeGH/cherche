import 'package:cherche_transport_u/external/responsive/models/custom_sizing_information.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    CustomSizingInformation sizingInformation,
  ) builder;

  final ScreenBreakpoints breakpoints;
  final RefinedBreakpoints refinedBreakpoints;

  const CustomResponsiveBuilder(
      {Key key, this.builder, this.breakpoints, this.refinedBreakpoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = CustomSizingInformation(
        deviceScreenType: getDeviceType(mediaQuery.size, breakpoints),
        refinedSize: getCustomRefinedSize(
          mediaQuery.size,
          refinedBreakpoint: refinedBreakpoints,
        ),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
