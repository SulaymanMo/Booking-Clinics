import 'package:booking_clinics/core/constant/const_color.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    Text("Create Account",
                    style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600 )),
                    SizedBox(height: 10),
                    Text("We are here to help you",style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xff6B7280),fontSize: 14),),
                    SizedBox(height: 30),
                    Customtextformfield(
                        preIcon: SvgPicture.asset("assets/icons/user.svg",width:2,height: 2),
                        hint: "Your Name"),
                    SizedBox(height: 10),
                    Customtextformfield(
                        preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                        hint: "Your Email"),
                    SizedBox(height: 10),
                    Customtextformfield(
                        preIcon: SvgPicture.asset("assets/icons/lock.svg"),
                        hint: "Password"),
                    SizedBox(height: 10),
                    
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
