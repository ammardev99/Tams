import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/auth/signup/view.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/utili/formating.dart';
import 'package:tams/utili/validations.dart';
import 'package:tams/utili/validators.dart';
import 'package:tams/widgets/inoutfield.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizeBox(50),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/logo.png'),
                ),
                sizeBox(20),
                customTitle('Login'),
                sizeBox(10),
                InputFormFieldApp(
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: state.userEmail,
                  inputType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                sizeBox(15),
                InputFormFieldApp(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: state.userPassword,
                  inputType: TextInputType.text,
                  validator: validpassword6digit,
                ),
                sizeBox(30),

                Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(secondaryColor),
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50)),
                    ),
                    onPressed: () async {
                      await logic.login();
                    },
                    child: logic.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : heading("Sign in", Colors.white),
                  );
                }),
                sizeBox(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    captionText('Don’t have an  account?', Colors.grey),
                    sizeBox(10, 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      child: subHeading("Sign up", secondaryColor),
                    )
                  ],
                ),

                sizeBox(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
