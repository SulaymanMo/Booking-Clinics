import 'package:flutter/material.dart';
import 'package:booking_clinics/core/constant/extension.dart';

class LoginView extends StatelessWidget {
  final String data;
  const LoginView({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.nav.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
