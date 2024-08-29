import 'dart:ui';

enum ConstColor {
  primary(Color(0xffA4CFC3)),
  dark(Color(0xff1C2A3A)),
  texture(Color(0xff9CA3AF)),
  secondary(Color(0xffF3F4F6));

  final Color color;
  const ConstColor(this.color);
}

// ? _____ Showcase for How to Use ConstColor _____ ? //
final Color primary = ConstColor.primary.color;
final Color secondary = ConstColor.secondary.color;

class MyColors {
  static const Color lightGray = Color(0xffF3F4F6);
  static const Color softGray = Color(0xff6B7280);
  static const Color dark = Color(0xff1C2A3A);
  static const Color gold = Color(0xffFEB052);

}
