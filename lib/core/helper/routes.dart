import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:booking_clinics/feature/booking/ui/view/doctor_details.dart';
import 'package:flutter/material.dart';
import '../constant/const_string.dart';
import '../../feature/home/ui/view/nav_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstString.homeRoute:
        return MaterialPageRoute(builder: (_) => const NavView());
      case ConstString.doctorDetailsRoute:
        return MaterialPageRoute(builder: (_) => const DoctorDetailsView());
      case ConstString.bookAppointmentRoute:
        return MaterialPageRoute(builder: (_) => const BookAppointmentView());
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
