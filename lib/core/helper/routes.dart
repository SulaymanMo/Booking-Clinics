import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:booking_clinics/data/services/remote/firebase_firestore.dart';
import 'package:booking_clinics/feature/booking/ui/view/book_appointment.dart';
import 'package:booking_clinics/feature/booking/ui/view/doctor_details.dart';
import 'package:booking_clinics/feature/see_all/ui/view/see_all_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_model.dart';
import '../../feature/auth/ui/views/edit_your_profile.dart';
import '../../feature/auth/ui/views/forget_password.dart';
import '../../feature/auth/ui/views/onboarding_screen2.dart';
import '../../feature/auth/ui/views/signin.dart';
import '../../feature/auth/ui/views/signup.dart';
import '../../feature/booking/cubit/doc_details_cubit.dart';
import '../../feature/chats/cubit/chat_details_cubit.dart';
import '../../feature/chats/ui/chat_details.dart';
import '../../feature/favorite/favorite_view.dart';
import '../../feature/profile/ui/profile_manager/profile_cubit.dart';
import '../../feature/see_all/data/see_all_repo_impl.dart';
import '../../feature/see_all/ui/manager/seeall_cubit.dart';
import '../constant/const_string.dart';
import '../../feature/home/ui/view/nav_view.dart';
import 'service_locator.dart';

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
            return BlocProvider<DoctorCubit>(
              create: (_) => DoctorCubit(getIt.get<FirebaseFirestoreService>())
                ..fetchFavorites(args["patientId"])
                ..fetchDoctorById(args["doctorId"]),
              child: const DoctorDetailsView(),
            );
          },
        );
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.signin:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.favoriteView:
        return MaterialPageRoute(builder: (_) => const FavoriteView());
      case Routes.editYourProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>.value(
            value: context.read<ProfileCubit>(),
            child: const EditYourProfile(),
          ),
        );
      case Routes.bookAppointmentRoute:
        return MaterialPageRoute(builder: (_) {
          return BookAppointmentView(
            model: settings.arguments as DoctorModel,
            // doctorId: args['doctorId'],
            // doctorName: args['doctorName'],
            // doctorSpeciality: args['doctorSpeciality'],
            // doctorAddress: args['doctorAddress'],
            // doctorImageUrl: args['doctorImageUrl'],
            // patientName: args['patientName'],
          );
        });
      case Routes.seeAll:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SeeAllCubit>(
            create: (_) => SeeAllCubit(getIt.get<SeeAllRepoImpl>()),
            child: SeeAllView(firstIndex: settings.arguments as int?),
          ),
        );
      case Routes.chatDetailsRoute:
        final chatModel = settings.arguments as ChatModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatDetailCubit(
              FirebaseFirestore.instance,
              chatModel.chatId,
            )..listenToMessages(),
            child: ChatDetailScreen(
              chatId: chatModel.chatId,
              chatPartnerName: chatModel.chatPartnerName,
              chatPartnerId: chatModel.chatPartnerId,
            ),
          ),
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
