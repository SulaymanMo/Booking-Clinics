import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:flutter/material.dart';

class signUp extends StatelessWidget {
   signUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          children: [
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/images/success_dialog.png',
                height: 200,
              ),
            ),
            SizedBox(height: 10),
            Text("Create Account"),
            SizedBox(height: 10),
            Text("We are here to help you"),
            TextFormField(
              cursorColor:primary,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: Icon(Icons.person_pin),
                prefixIconColor: primary,
                hintText: "Your Name",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color:primary,

                ),
              ),
            )
            /**
             *
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 2.0, color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
             */
            
          ],
        ),
      ),
    );
  }
}
