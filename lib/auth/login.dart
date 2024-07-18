import 'package:flutter/material.dart';
import 'package:tams/Screens/home.dart';
import 'package:tams/auth/signup.dart';
import 'package:tams/components/assets.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeBox(0, 0100),
              titleHeading("TAMS \nWelcome back 👋", Colors.black),
              captionText(
                  "Please enter your email & pasword to sign in.", Colors.grey),
              sizeBox(0, 50),
              TextField(
                decoration:
                    inputStyle(Icons.email_rounded, "Email", "Enter your email"),
              ),
              sizeBox(0, 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: secondaryColor03,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: secondaryColor),
                  hintText: "Enter your password",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  alignLabelWithHint: true,
                  suffix: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: secondaryColor03,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: secondaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: secondaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: secondaryColor),
                  ),
                  focusColor: secondaryColor,
                  hoverColor: secondaryColor,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
                obscureText: _showPassword,
              ),
              sizeBox(0, 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  captionText("Don't have an account?", Colors.grey),
                  sizeBox(10, 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: subHeading("Sign up", secondaryColor),
                  )
                ],
              ),
              sizeBox(0, 20),
              // const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 48),
                      backgroundColor: secondaryColor),
                  child:
                      const Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ),
              sizeBox(10, 40),
            ],
                    ),
                  ),
          )),
    );
  }
}
