import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/Screens/home.dart';
import 'package:tams/auth/login/state.dart';
import 'package:tams/components/assets.dart';

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
    update(); // Notify listeners that the state has changed

    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: state.userEmail.text,
        password: state.userPassword.text.toString(),
      );

      // Login successful
      dataloading = false;
      isLoading.value = false;
      Get.snackbar("Login", "Successful", backgroundColor: secondaryColor03);
      Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase exceptions
      // Get.snackbar("Error", e.message ?? "An error occurred", backgroundColor: secondaryColor);
      // Get.snackbar("Error", e.message ?? "An error occurred", backgroundColor: secondaryColor);
      Get.snackbar("Error", 'email / passowrd not match',
          backgroundColor: secondaryColor03);
      log(e.message ?? "An error occurred");
      dataloading = false;
      isLoading.value = false;
    } catch (e) {
      // Handle general exceptions
      Get.snackbar("Error", "An error occurred",
          backgroundColor: secondaryColor03);
      log(e.toString());
      dataloading = false;
      isLoading.value = false;
    }

    update(); // Notify listeners that the state has changed
  }
}
