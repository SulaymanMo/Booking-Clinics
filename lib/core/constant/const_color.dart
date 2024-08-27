import 'dart:ui';

enum ConstColor {
  primary(Color(0xffA4CFC3)),
  secondary(Color(0xffA4CFC3));

  final Color color;
  const ConstColor(this.color);
}

// ? _____ Showcase for How to Use ConstColor _____ ? //
final Color primary = ConstColor.primary.color;
final Color secondary = ConstColor.secondary.color;
