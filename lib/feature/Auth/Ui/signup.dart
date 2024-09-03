import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_evaulated_button.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/custom_text_form_field.dart';
import 'package:booking_clinics/feature/Auth/Ui/widgets/socilal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Image.asset('assets/images/logo.png', height: 66, width: 66),
                const SizedBox(height: 10),
                const Row(
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
                const SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    const Text(
                      "We are here to help you",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280),
                          fontSize: 14),
                    ),
                    const SizedBox(height: 30),
                    // const Input(
                    //   hint: "Your Name",
                    //   prefix:Icon(sa),
                    // ),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/user.svg",
                          ),
                        hint: "Your Name"),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/sms.svg"),
                        hint: "Your Email"),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                        preIcon: SvgPicture.asset("assets/icons/lock.svg"),
                        hint: "Password"),
                    const SizedBox(height: 10),
                    const CustomEvaulatedButton(title: "Create Account"),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Divider(color: Color(0xff6B7280)),
                          ),
                        ),
                        const Text(
                          "Or",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Divider(color: Color(0xff6B7280)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SocialButton(
                        iconUrl: "assets/icons/Google - Original.svg",
                        title: "Continue with Google"),
                    const SizedBox(height: 10),
                    const SocialButton(
                        iconUrl: "assets/icons/_Facebook.svg",
                        title: "Continue with Facebook"),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do you have an account ? ",
                          style:
                              TextStyle(color: Color(0xff6B7280), fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Color(0xff1C64F2),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
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
