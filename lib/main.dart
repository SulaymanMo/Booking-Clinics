import 'firebase_options.dart';
import 'core/helper/routes.dart';
import 'package:sizer/sizer.dart';
import 'core/theme/light_theme.dart';
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
  setupServiceLocator();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ! _____
  // ! _____ Open Hive Boxes Here below... for Example _____ ! //
  await Hive.openBox<Map<dynamic, dynamic>>(ConstString.userAuthBox);
  // ! _____
  FlutterNativeSplash.remove();
  runApp(const BookingClinics());
}

class BookingClinics extends StatelessWidget {
  const BookingClinics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Booking Clinics',
          theme: lightTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: ConstString.doctorDetailsRoute,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
