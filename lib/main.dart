import 'package:booking_clinics/core/helper/observer.dart';
import 'package:booking_clinics/core/theme/dark_theme.dart';
import 'package:booking_clinics/feature/home/data/repo/home_repo_impl.dart';
import 'package:booking_clinics/feature/home/ui/manager/search/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/remote/firebase_auth.dart';
import 'firebase_options.dart';
import 'core/helper/routes.dart';
import 'package:sizer/sizer.dart';
import 'core/theme/light_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/constant/const_string.dart';
import 'core/helper/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // ! _____ App Setup & Initialization _____ ! //
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await Hive.initFlutter();
  Bloc.observer = Observer();
  // ! _____ Prevent Device Orientation _____ ! //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ! _____ Open Hive Boxes Here below... for Example _____ ! //
  await Hive.openBox<Map<dynamic, dynamic>>(ConstString.userAuthBox);

  bool isUserLoggedIn = await FirebaseAuthService().isLoggedIn();
  // ! _____
  FlutterNativeSplash.remove();
  runApp(BookingClinics(isUserLoggedIn: isUserLoggedIn));
}

class BookingClinics extends StatelessWidget {
  const BookingClinics({super.key, required this.isUserLoggedIn});

  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (_) => SearchCubit(getIt.get<HomeRepoImpl>()),
          child: MaterialApp(
            builder: (_, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.125),
                ),
                child: child!,
              );
            },
            theme: lightTheme(),
            darkTheme: darkTheme(),
            title: 'Booking Clinics',
            debugShowCheckedModeBanner: false,
            initialRoute: isUserLoggedIn ? Routes.navRoute : Routes.onboarding,
            onGenerateRoute: AppRouter.generateRoute,
            //  home: signUp(),
          ),
        );
      },
    );
  }
}
