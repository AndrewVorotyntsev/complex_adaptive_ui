import 'package:flutter/material.dart';

enum FormFactorType { Monitor, SmallPhone, LargePhone, Tablet }

class DeviceType {
  static FormFactorType get(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide <= 300) return FormFactorType.SmallPhone;
    if (shortestSide <= 600) return FormFactorType.LargePhone;
    if (shortestSide <= 900) return FormFactorType.Tablet;
    return FormFactorType.Monitor;
  }

  static bool isPhone(BuildContext context) => isSmallPhone(context) || isLargePhone(context);
  static bool isTablet(BuildContext context) => get(context) == FormFactorType.Tablet;
  static bool isMonitor(BuildContext context) => get(context) == FormFactorType.Monitor;
  static bool isSmallPhone(BuildContext context) => get(context) == FormFactorType.SmallPhone;
  static bool isLargePhone(BuildContext context) => get(context) == FormFactorType.LargePhone;
}
