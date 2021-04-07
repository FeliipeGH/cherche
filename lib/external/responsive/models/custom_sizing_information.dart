import 'package:cherche_transport_u/external/responsive/enums/custom_refined_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomSizingInformation {
  final DeviceScreenType deviceScreenType;
  final CustomRefinedSize refinedSize;
  final Size screenSize;
  final Size localWidgetSize;

  bool get isMobile => deviceScreenType == DeviceScreenType.mobile;

  bool get isTablet => deviceScreenType == DeviceScreenType.tablet;

  bool get isDesktop => deviceScreenType == DeviceScreenType.desktop;

  bool get isWatch => deviceScreenType == DeviceScreenType.watch;

  // Refined

  bool get isExtraLarge => refinedSize == CustomRefinedSize.extraLarge;

  bool get isLarge => refinedSize == CustomRefinedSize.large;

  bool get isNormal => refinedSize == CustomRefinedSize.normal;

  bool get isSmall => refinedSize == CustomRefinedSize.small;

  CustomSizingInformation({
    this.deviceScreenType,
    this.refinedSize,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'DeviceType:$deviceScreenType RefinedSize:$refinedSize ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
