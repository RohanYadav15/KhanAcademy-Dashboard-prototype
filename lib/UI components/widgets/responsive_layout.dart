import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;
  ResponsiveLayout(
      {Key? key,
      required this.tiny,
      required this.phone,
      required this.tablet,
      required this.largeTablet,
      required this.computer})
      : super(key: key);

  static double tinyHeightLimit = 100;
  static double tinyLimit = 100;
  static double phoneLimit = 580;
  static double tabletLimit = 880;
  static double largeTabletLimit = 1100;

  static bool isTinyHeight(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;

  static bool istiny(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width > tinyLimit &&
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > phoneLimit &&
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletLimit &&
      MediaQuery.of(context).size.width < largeTabletLimit;

  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width > largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < tinyLimit)
        return tiny;
      else if (constraints.maxWidth < phoneLimit)
        return phone;
      else if (constraints.maxWidth < tabletLimit)
        return tablet;
      else if (constraints.maxWidth < largeTabletLimit)
        return largeTablet;
      else
        return computer;
    });
  }
}
