import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/Screens/home.dart';
import 'package:tams/models/order.dart';
import 'package:tams/models/service.dart';
import 'package:http/http.dart' as http;
import 'state.dart';

class OrderLogic extends GetxController {
  final OrderState state = OrderState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Service service;
  RxBool showDetails = false.obs;
  RxBool addMembersSpace = false.obs;
  RxBool isLoading = false.obs;

  void changeView() {
    showDetails.value = !showDetails.value;
  }

  void updateTotal() {
    state.totalPrice.value = state.totalMembers.value * selectedService.price;
  }

  get formKey => _formKey;
  void placeOrder(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      debugPrint("Order Placed");

      // Extracting the values from the state
      String userName = state.customerName.text;
      String userCNIC = state.customerCNIC.text;
      String userEmail = state.customerEmail.text;
      String userAddress = state.customerAddress.text;
      String userEmergencyContact = state.customerEmergencyPhone.text;
      String userPhoneNumber = state.customerPhone.text;
      String referral = state.customerReferralCode.text;

      // Creating the order data
      Map<String, dynamic> orderData = {
        'serviceId': selectedService.id,
        'userName': userName,
        'userCNIC': userCNIC,
        'userPhoneNumber': userPhoneNumber,
        'userEmergencyContact': userEmergencyContact,
        'userEmail': userEmail,
        'userAddress': userAddress,
        'totalAmount': state.totalPrice.toInt(),
        'totalMembers': state.totalMembers.toInt(),
        'referral': referral,
        'confirmed': state.orderStatus.value.toString()
      };
      // Making the POST request
      var url = Uri.parse('https://travelagency-rho.vercel.app/api/order');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(orderData),
      );
      isLoading.value = false;
      if (response.statusCode == 200) {
        debugPrint('Order placed successfully: ${response.body}');
        // Show success popup
        Get.defaultDialog(
          title: "Success",
          content: const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          child: Text("Order placed successfully!"),
          ),
          onConfirm: () {
            Get.offAll(const HomePage());
          },
          textConfirm: "Home",
        );
      } else {
        debugPrint('Failed to place order: ${response.statusCode}');
        // Show error message
        Get.snackbar("Error", "Failed to place order. Please try again.");
      }

      // if (response.statusCode == 200) {
      //   debugPrint('Order placed successfully: ${response.body}');
      // } else {
      //   debugPrint('Failed to place order: ${response.statusCode}');
      // }
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
