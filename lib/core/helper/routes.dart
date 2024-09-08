import 'package:booking_clinics/feature/Auth/Ui/edit_your_profile.dart';
import 'package:booking_clinics/feature/Auth/Ui/forget_password.dart';
import 'package:booking_clinics/feature/Auth/Ui/onboarding_screen.dart';
import 'package:booking_clinics/feature/Auth/Ui/signin.dart';
import 'package:booking_clinics/feature/Auth/Ui/signup.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:booking_clinics/feature/booking/ui/view/doctor_details.dart';
import 'package:flutter/material.dart';
import '../constant/const_string.dart';
import '../../feature/home/ui/view/nav_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const NavView(),
        );
      case Routes.doctorDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const DoctorDetailsView(),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
        case Routes.signin:
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
        );
        case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
        case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
        case Routes.editYourProfile:
        return MaterialPageRoute(
          builder: (_) => const EditYourProfile(),
        );

      case Routes.bookAppointmentRoute:
        return MaterialPageRoute(
          builder: (_) => const BookAppointmentView(),
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
