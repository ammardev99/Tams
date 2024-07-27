import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/modules/auth/login/view.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/utili/formating.dart';
import 'package:tams/utili/validations.dart';
import 'package:tams/widgets/inoutfield.dart';
import 'logic.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final logic = Get.put(SignupLogic());
  final state = Get.find<SignupLogic>().state;

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
                customTitle('Sign up'),
                sizeBox(10),
                InputFormFieldApp(
                  label: 'Name',
                  hint: 'Enter your full name',
                  controller: state.userFullName,
                  inputType: TextInputType.name,
                  validator: validFullName,
                ),
                sizeBox(15),
                InputFormFieldApp(
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: state.userEmail,
                  inputType: TextInputType.emailAddress,
                  validator: validEmail,
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
                      await logic.signup();
                    },
                    child: logic.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : heading("Sign up", Colors.white),
                  );
                }),
                sizeBox(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    captionText("Do you have an account?", Colors.grey),
                    sizeBox(10, 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: subHeading("Login", secondaryColor),
                    )
                  ],
                ),
                sizeBox(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
