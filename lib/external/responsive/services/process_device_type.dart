import 'package:cherche_transport_u/external/responsive/enums/custom_refined_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Returns the [DeviceScreenType] that the application is currently running on
DeviceScreenType getProcessDeviceType(
  Size size, [
  ScreenBreakpoints breakpoint,
]) {
  double deviceWidth = size.shortestSide;

  if (kIsWeb) {
    deviceWidth = size.width;
  }

  // Replaces the defaults with the user defined definitions
  if (breakpoint != null) {
    if (deviceWidth > breakpoint.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth > breakpoint.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth < breakpoint.watch) {
      return DeviceScreenType.watch;
    }
  } else {
    // If no user defined definitions are passed through use the defaults
    if (deviceWidth >= ResponsiveSizingConfig.instance.breakpoints.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth >= ResponsiveSizingConfig.instance.breakpoints.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth < ResponsiveSizingConfig.instance.breakpoints.watch) {
      return DeviceScreenType.watch;
    }
  }

  return DeviceScreenType.mobile;
}

/// Returns the [RefinedSize] for each device that the application is currently running on
CustomRefinedSize getCustomRefinedSize(
  Size size, {
  RefinedBreakpoints refinedBreakpoint,
  bool isWebOrDesktop = kIsWeb,
}) {
  DeviceScreenType deviceScreenType = getDeviceType(size);
  double deviceWidth = size.shortestSide;

  if (isWebOrDesktop) {
    deviceWidth = size.width;
  }

  if (deviceScreenType == DeviceScreenType.tablet ||
      deviceScreenType == DeviceScreenType.desktop) {
    deviceWidth = size.width;
  }

  // Replaces the defaults with the user defined definitions
  if (refinedBreakpoint != null) {
    if (deviceScreenType == DeviceScreenType.desktop) {
      if (deviceWidth > refinedBreakpoint.desktopExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.desktopLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.desktopNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }

    if (deviceScreenType == DeviceScreenType.tablet) {
      if (deviceWidth > refinedBreakpoint.tabletExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.tabletLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.tabletNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }

    if (deviceScreenType == DeviceScreenType.mobile) {
      if (deviceWidth > refinedBreakpoint.mobileExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.mobileLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.mobileNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }

    if (deviceScreenType == DeviceScreenType.watch) {
      return CustomRefinedSize.normal;
    }
  } else {
    // If no user defined definitions are passed through use the defaults

    // Desktop
    if (deviceScreenType == DeviceScreenType.desktop) {
      if (deviceWidth >=
          ResponsiveSizingConfig
              .instance.refinedBreakpoints.desktopExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.desktopLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.desktopNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }

    // Tablet
    if (deviceScreenType == DeviceScreenType.tablet) {
      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.tabletExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.tabletLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.tabletNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }

    // Mobile
    if (deviceScreenType == DeviceScreenType.mobile) {
      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.mobileExtraLarge) {
        return CustomRefinedSize.extraLarge;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.mobileLarge) {
        return CustomRefinedSize.large;
      }

      if (deviceWidth >=
          ResponsiveSizingConfig.instance.refinedBreakpoints.mobileNormal) {
        return CustomRefinedSize.normal;
      }
      return CustomRefinedSize.small;
    }
  }

  return CustomRefinedSize.normal;
}

/// Will return one of the values passed in for the device it's running on
T getCustomValueForScreenType<T>({
  BuildContext context,
  T mobile,
  T tablet,
  T desktop,
  T watch,
}) {
  var deviceScreenType = getDeviceType(MediaQuery.of(context).size);
  // If we're at desktop size
  if (deviceScreenType == DeviceScreenType.desktop) {
    // If we have supplied the desktop layout then display that
    if (desktop != null) return desktop;
    // If no desktop layout is supplied we want to check if we have the size below it and display that
    if (tablet != null) return tablet;
  }

  if (deviceScreenType == DeviceScreenType.tablet) {
    if (tablet != null) return tablet;
  }

  if (deviceScreenType == DeviceScreenType.watch && watch != null) {
    return watch;
  }

  // If none of the layouts above are supplied or we're on the mobile layout then we show the mobile layout
  return mobile;
}

/// Will return one of the values passed in for the refined size
T getCustomValueForRefinedSize<T>({
  BuildContext context,
  T small,
  T normal,
  T large,
  T extraLarge,
}) {
  var refinedSize = getCustomRefinedSize(MediaQuery.of(context).size);
  // If we're at extra large size
  if (refinedSize == CustomRefinedSize.extraLarge) {
    // If we have supplied the extra large layout then display that
    if (extraLarge != null) return extraLarge;
    // If no extra large layout is supplied we want to check if we have the size below it and display that
    if (large != null) return large;
  }

  if (refinedSize == CustomRefinedSize.large) {
    // If we have supplied the large layout then display that
    if (large != null) return large;
    // If no large layout is supplied we want to check if we have the size below it and display that
    if (normal != null) return normal;
  }

  if (refinedSize == CustomRefinedSize.normal) {
    // If we have supplied the normal layout then display that
    if (normal != null) return normal;
  }

  if (refinedSize == CustomRefinedSize.small) {
    // If we have supplied the normal layout then display that
    if (normal != null) return small;
  }

  // If none of the layouts above are supplied or we're on the normal size layout then we show the normal layout
  return normal;
}

class ScreenTypeValueBuilder<T> {
  @Deprecated('Use better named global function getValueForScreenType')
  T getValueForType({
    BuildContext context,
    T mobile,
    T tablet,
    T desktop,
    T watch,
  }) {
    return getValueForScreenType(
        context: context,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        watch: watch);
  }
}
