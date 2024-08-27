import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ScaffoldState get scaffold => Scaffold.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  NavigatorState get nav => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
