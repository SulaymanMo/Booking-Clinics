import 'package:booking_clinics/home/ui/view/home_view.dart';
import 'package:flutter/material.dart';
import '../constant/const_string.dart';
import '../../feature/auth/ui/view/login_view.dart';
import '../../feature/auth/ui/view/register_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstString.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case ConstString.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(data: settings.arguments as String),
        );
      case ConstString.activateRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
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
