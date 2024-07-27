import 'package:flutter/material.dart';

class SignupState {
  TextEditingController userFullName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  SignupState() {
    userFullName = TextEditingController();
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }
}
