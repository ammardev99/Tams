import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/models/service.dart';
import 'package:http/http.dart' as http;
import 'state.dart';

class OrderLogic extends GetxController {
  final OrderState state = OrderState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Service service;

  get formKey => _formKey;
  void placeOrder() async {
    if (_formKey.currentState!.validate()) {
      debugPrint("Order Placed");
      // Extracting the values from the state
      String tourId = state.toursId;
      String customerName = state.customerName.text;
      String customerCNIC = state.customerCNIC.text;
      String customerEmail = state.customerEmail.text;
      String customerEmergencyPhone = state.customerEmergencyPhone.text;
      String customerPhone = state.customerPhone.text;
      String customerReferralCode = state.customerReferralCode.text;

      // Creating the order data
    //   Map<String, dynamic> orderData = {
    //     'serviceId': tourId,
    //     'userName': customerName,
    //     'userCNIC': customerCNIC,
    //     'userPhoneNumber': customerPhone,
    //     'userEmergencyContact': customerEmergencyPhone,
    //     'userEmail': customerEmail,
    //     'userAddress':
    //     'Your address here', // You need to get the actual address
    //     'totalAmount': 20000, // You need to get the actual total amount
    //     'totalMembers': 1, // You need to get the actual number of members
    //     'referral': customerReferralCode,
    //     'confirmed': 'true'
    //   };
    //   // Making the POST request
    //   var url = Uri.parse('https://travelagency-rho.vercel.app/api/order');
    //   var response = await http.post(url,
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode(orderData),
    //   );

    //   if (response.statusCode == 200) {
    //     debugPrint('Order placed successfully: ${response.body}');
    //   } else {
    //     debugPrint('Failed to place order: ${response.statusCode}');
    //   }
    }
  }

  loadService() {
    // Get the arguments passed from the previous screen
    final arguments = Get.arguments as List;
    final List<Service> services = arguments[0];
    final int index = arguments[1];
    // Get the service at the provided index
    service = services[index];
  }
}
