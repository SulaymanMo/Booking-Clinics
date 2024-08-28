import 'package:flutter/material.dart';
import '../constant/const_string.dart';
import '../../feature/home/ui/view/home_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstString.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
