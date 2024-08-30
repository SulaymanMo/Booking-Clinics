import 'dart:ui';

enum ConstColor {
  main(Color(0xff4B5563)),
  primary(Color(0xffA4CFC3)),
  icon(Color(0xff9CA3AF)),
  textBtn(Color(0xff6B7280)),
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
