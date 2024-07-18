import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tams/models/service.dart';

class ServiceOrder {
  bool selected;
  String id;
  String serviceId;
  int totalMembers;
  double totalAmount;
  bool confirmed;
  ServiceOrder({
    required this.selected,
    required this.id,
    required this.serviceId,
    required this.totalMembers,
    required this.totalAmount,
    required this.confirmed,
  });
  void setOrder(select, orderId, serviceid, tm, tp, status) {
    selected = select;
    id = orderId;
    serviceId = serviceid;
    totalMembers = tm;
    totalAmount = tp;
    confirmed = status;
  }

  void viewOrder() {
    // ignore: avoid_print
    debugPrint(
        "selected: $selected \nID: $id \nTotal Members$totalMembers \nTotal Amount: $totalAmount \nConfirmed: $confirmed");
  }
}

// set nul service
Service selectedService = Service(
  id: '',
  title: '',
  description: '',
  startdate: '',
  category: '',
  duration: '',
  price: 0,
  image: Uint8List(0),
);

ServiceOrder order = ServiceOrder(
    selected: false,
    id: '00',
    serviceId: '00',
    totalMembers: 0,
    totalAmount: 0,
    confirmed: false);
