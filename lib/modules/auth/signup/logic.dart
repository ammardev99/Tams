import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/modules/auth/login/view.dart';
import 'package:tams/components/assets.dart';

import 'state.dart';

class SignupLogic extends GetxController {
  final SignupState state = SignupState();
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    auth
        .createUserWithEmailAndPassword(
            email: state.userEmail.text.toString(),
            password: state.userPassword.text.toString())
        .then((value) {
      // print('User registered successfully');
      isLoading.value = false;
      update();
      Get.snackbar("Signup", "Successful", backgroundColor: secondaryColor);
      Get.offAll(LoginPage());
    }).onError((error, stackTrace) {
      log(error.toString());
      isLoading.value = false;
      update();
    });
  }
}
