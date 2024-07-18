import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/order.dart';
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
        leading: BackButton(
          color: whiteColor,
        ),
        backgroundColor: secondaryColor,
        title: heading('Order', whiteColor),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: logic.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
// Total Members
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    heading("Total Members", primaryColor),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (state.totalMembers.value > 0) {
                                state.totalMembers.value--;
                              }
                              logic.updateTotal();
                              if (state.totalMembers <= 0) {
                                logic.addMembersSpace.value = true;
                              }
                            },
                            icon: const Icon(Icons.remove_circle_outline)),
                        Obx(() {
                          return heading("${state.totalMembers}", primaryColor);
                        }),
                        IconButton(
                            onPressed: () {
                              state.totalMembers.value++;
                              logic.updateTotal();
                              if (state.totalMembers > 0) {
                                logic.addMembersSpace.value = false;
                              }
                            },
                            icon: const Icon(Icons.add_circle_outline)),
                      ],
                    )
                  ],
                ),
// zero error
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      return logic.addMembersSpace.value
                          ? textInfo('Please add members', Colors.red)
                          : Container();
                    }),
                  ],
                ),

// Service Details option
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    heading('Service Details', primaryColor),
                    IconButton(onPressed: () {
                      logic.changeView();
                    }, icon: Obx(() {
                      return logic.showDetails.value == true
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.remove_red_eye_outlined);
                    }))
                  ],
                ),

// service details
                Obx(() {
                  return logic.showDetails.value == true
                      ? RefreshIndicator(
                          onRefresh: () async {
                            // Simulating network request or data fetch with a 10-second delay
                            await Future.delayed(Durations.long1);
                            // Logic to refresh data goes here, if any
                          },
                          child: FutureBuilder(
                            future: Future.delayed(Durations.long1),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // While waiting for the future to complete, show the loading indicator
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                // When the future completes, show the actual data
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.memory(
                                        selectedService.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    heading1(
                                        selectedService.title, Colors.black),
                                    sizeBox(10, 20),
                                    icontInfo(
                                      Icons.person,
                                      selectedService.category == '1'
                                          ? 'Category: All'
                                          : selectedService.category == '2'
                                              ? 'Category: Female'
                                              : 'Category: Male',
                                    ),
                                    sizeBox(15, 15),
                                    icontInfo(
                                      Icons.sunny_snowing,
                                      'Duration: ${selectedService.duration} days'
                                          .toString(),
                                    ),
                                    // sizeBox(15, 15),
                                    // icontInfo(
                                    //   Icons.date_range_outlined,
                                    //   'Date: ${selectedService.startdate}',
                                    // ),
                                    sizeBox(15, 15),
                                    icontInfo(
                                      Icons.receipt_long_outlined,
                                      'Price: ${selectedService.price.toString()} /Per Head',
                                      Colors.red[300],
                                    ),
                                    sizeBox(10, 20),
                                  ],
                                );
                              }
                            },
                          ),
                        )
                      : sizeBox(0, 0);
                }),
                sizeBox(10, 10),
// Total Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    heading("Total Price", primaryColor),
                    Obx(() {
                      return heading("Rs. ${state.totalPrice}", primaryColor);
                    })
                  ],
                ),

// input fields
                sizeBox(10, 30),
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
                // zero error
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return logic.addMembersSpace.value
                          ? textInfo('Please add members first', Colors.red)
                          : Container();
                    }),
                  ],
                ),

                sizeBox(15, 10),

                Center(
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(primaryColor),
                        padding: const WidgetStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                vertical: 20, horizontal: 100)),
                      ),
                      onPressed: () {
                        if (state.totalMembers.value > 0) {
                          logic.addMembersSpace.value = false;
                          logic.placeOrder();
                        } else {
                          logic.addMembersSpace.value = true;
                        }
                      },
                      child: heading("Place Order", whiteColor)),
                ),
                sizeBox(15, 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
