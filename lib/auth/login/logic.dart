import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/Screens/home.dart';
import 'package:tams/components/assets.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  RxBool isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  bool dataloading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    dataloading = true;
    update();
    auth
        .signInWithEmailAndPassword(
            email: state.userEmail.text,
            password: state.userPassword.text.toString())
        .then((value) {
      dataloading = false;

      // showSnackBar('Message', 'Login Successful!');
      update();
      Get.snackbar("Login", "Successful", backgroundColor: secondaryColor);
      Get.offAll(const HomePage());

      // Get.offAllNamed(RouteName.widgetApp);
      dataloading = false;
      update();
    }).onError((error, stackTrace) {
      // Utils().toastMessage(error.toString());
      // showSnackBar('Message', 'Server Error');
            Get.snackbar("error", "email / passowrd not match", backgroundColor: secondaryColor);

      log(error.toString());
      update();
      dataloading = false;
      update();
    });
    // showSnackBar('App', 'Wellcom');
    isLoading.value = false;
  }
}
