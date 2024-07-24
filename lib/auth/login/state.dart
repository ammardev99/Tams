import 'package:flutter/material.dart';

class LoginState {
  TextEditingController userEmail  = TextEditingController();
  TextEditingController userPassword  = TextEditingController();
  TextEditingController loggedInUserEmail  = TextEditingController();

  LoginState() {
    userEmail = TextEditingController();
    userPassword = TextEditingController();
  }

}
