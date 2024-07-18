// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderState {
  RxInt totalMembers = 0.obs;
  RxInt totalPrice = 0.obs;
  RxBool orderStatus = false.obs;
  TextEditingController toursName = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController customerPhone = TextEditingController();
  TextEditingController customerCNIC = TextEditingController();
  TextEditingController customerEmergencyPhone = TextEditingController();
  TextEditingController customerEmail = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController customerReferralCode = TextEditingController();



  OrderState() {
    ///Initialize variables
  }
}
