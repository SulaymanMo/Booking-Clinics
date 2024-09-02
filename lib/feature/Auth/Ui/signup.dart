import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/core/helper/customTextFormField.dart';
import 'package:flutter/material.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: [
                SizedBox(height: 50),
                Image.asset('assets/images/logo.png', height: 66, width: 66),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Health",
                      style: TextStyle(fontSize: 20, color: Color(0xff6B7280)),
                    ),
                    Text(
                      "Pal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create Account"),
                    SizedBox(height: 10),
                    Text("We are here to help you"),
                    Customtextformfield(
                        preIcon: Icon(Icons.person), hint: "Your Name"),
                    Customtextformfield(
                        preIcon: Icon(Icons.person), hint: "Your Name"),
                    Customtextformfield(
                        preIcon: Icon(Icons.person), hint: "Your Name"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
