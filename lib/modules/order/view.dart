import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/utili/validations.dart';
import 'package:tams/widgets/inoutfield.dart';

import 'logic.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});

  final logic = Get.put(OrderLogic());
  final state = Get.find<OrderLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: heading('Order', primaryColor),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: logic.formKey,
            child: Column(
              children: [
                // heading(logic.service.id, Colors.black),
                heading(Get.arguments.toString(), Colors.black),
                state.toursId= Get.arguments,
                // Tour,
                // InputFormFieldApp(
                //     label: "Tour",
                //     hint: 'Title',
                //     controller: TextEditingController(),
                //     inputType: TextInputType.text),
                sizeBox(10, 15),
                // name
                InputFormFieldApp(
                    label: "Customer Name",
                    hint: 'Full Name',
                    controller: state.customerName,
                    inputType: TextInputType.text,
                    validator: validName),
                sizeBox(15, 15),
                // numbers
                InputFormFieldApp(
                    label: "Number",
                    hint: 'hint',
                    controller: state.customerPhone,
                    inputType: TextInputType.phone,
                    validator: validPhoneNumber),
                sizeBox(15, 15),
                // CNIC
                InputFormFieldApp(
                    label: "CNIC",
                    hint: 'xxxxx-xxxxxxx-x',
                    controller: state.customerCNIC,
                    inputType: TextInputType.text,
                    validator: validCNIC),
                sizeBox(15, 15),
                // emergency
                InputFormFieldApp(
                    label: "Emergency",
                    hint: 'hint',
                    controller: state.customerEmergencyPhone,
                    inputType: TextInputType.phone,
                    validator: validPhoneNumber),
                sizeBox(15, 15),
                // Address Email
                InputFormFieldApp(
                    label: "Email",
                    hint: 'hint',
                    controller: state.customerEmail,
                    inputType: TextInputType.emailAddress,
                    validator: validEmail),
                sizeBox(15, 15),
                // Refrerral code
                InputFormFieldApp(
                    label: "Referral Code",
                    hint: 'Agent Code',
                    controller: state.customerReferralCode,
                    inputType: TextInputType.number,
                    validator: validReferralCode),
                sizeBox(15, 15),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(primaryColor),
                      padding: const WidgetStatePropertyAll(
                          EdgeInsetsDirectional.symmetric(
                              vertical: 20, horizontal: 40)),
                    ),
                    onPressed: () {
                      logic.placeOrder();
                    },
                    child: heading("Place Order", whiteColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
