import 'firebase_options.dart';
import 'core/helper/routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'core/constant/const_string.dart';
import 'core/helper/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // ! _____ App Setup & Initalization _____ ! //
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  setupServiceLocator();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ! _____
  // ! _____ Open Hive Boxes Here _____ ! //
  await Hive.openBox<Map<dynamic, dynamic>>(ConstString.userAuthBox);
  // ! _____
  FlutterNativeSplash.remove();
  runApp(const BookingClinics());
}

class BookingClinics extends StatelessWidget {
  const BookingClinics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Clinics',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: ConstString.registerRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
