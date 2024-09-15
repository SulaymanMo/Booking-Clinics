import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:booking_clinics/feature/booking/ui/view/doctor_details.dart';
import 'package:booking_clinics/feature/see_all/ui/view/see_all_view.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/ui/views/edit_your_profile.dart';
import '../../feature/auth/ui/views/forget_password.dart';
import '../../feature/auth/ui/views/onboarding_screen.dart';
import '../../feature/auth/ui/views/signin.dart';
import '../../feature/auth/ui/views/signup.dart';
import '../constant/const_string.dart';
import '../../feature/home/ui/view/nav_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.navRoute:
        return MaterialPageRoute(builder: (_) => const NavView());
      case Routes.doctorDetailsRoute:
        return MaterialPageRoute(
          builder: (_) {
            final args = settings.arguments as Map<String, dynamic>;
            return DoctorDetailsView(
              doctorId: args['doctorId'],
              patientName: args['patientName'],
            );
          },
        );
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.signin:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.editYourProfile: //TODO: Update This Root
        return MaterialPageRoute(builder: (_) => const EditYourProfile());
      case Routes.bookAppointmentRoute:
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments as Map<String, dynamic>;
          return BookAppointmentView(
            doctorId: args['doctorId'],
            doctorName: args['doctorName'],
            doctorSpeciality: args['doctorSpeciality'],
            doctorAddress: args['doctorAddress'],
            doctorImageUrl: args['doctorImageUrl'],
            patientName: args['patientName'],
          );
        });
      case Routes.seeAll:
        return MaterialPageRoute(builder: (_) => const SeeAllView());

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
