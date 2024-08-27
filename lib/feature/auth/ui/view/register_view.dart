import 'package:flutter/material.dart';
import '../../../../core/constant/const_string.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Register View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.nav.pushNamed(
            ConstString.loginRoute,
            arguments: "Data from register view",
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
