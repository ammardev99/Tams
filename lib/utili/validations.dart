import 'package:get/get.dart';

//App//

//Name
String? validName(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Name is required';
  }
  return null;
}

//Full Name Validation:
String? validFullName(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Full Name is required';
  }
  if (value!.length < 3) {
    return 'Full Name must be at least 3 characters long';
  }
  if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
    return 'Full Name can only contain letters and spaces';
  }
  return null;
}

//Email Validation:
String? validEmail(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Email is required';
  } else if (!GetUtils.isEmail(value!)) {
    return 'Invalid email';
  }
  return null;
}

//Address Validation:
String? validAddress(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Address is required';
  }
  return null;
}

//Phone Number
String? validPhoneNumber(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Phone number is required';
  }
  if (!RegExp(r'^03\d{9}$').hasMatch(value!)) {
    return 'Invalid phone number';
  }
  return null;
}

// 8 digit Password
String? validpassword8digit(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Password is required';
  }
  if (value!.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
    return 'Password must have at least one uppercase letter';
  }
  if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
    return 'Password must have at least one lowercase letter';
  }
  if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
    return 'Password must have at least one digit';
  }
  if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
    return 'Password must have at least one special character';
  }
  return null;
}

// 6 digit Password
String? validpassword6digit(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Password is required';
  }
  if (value!.length != 6) {
    return 'Password must be exactly 6 characters long';
  }
  if (!RegExp(r'^[a-zA-Z0-9!@#$&*~]+$').hasMatch(value)) {
    return 'Password must contain only letters, digits, or special characters (!@#\$&*~)';
  }
  return null;
}

// CNIC
String? validCNIC(String? value) {
  if ((value ?? "").isEmpty) {
    return 'CNIC number is required';
  }
  if (!RegExp(r'^\d{5}-\d{7}-\d{1}$').hasMatch(value!)) {
    return 'Invalid CNIC number xxxxx-xxxxxxx-x';
  }
  return null;
}


//Branch Code
String? validBranchCode(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Branch code is required';
  }
  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value!)) {
    return 'Invalid branch code';
  }
  return null;
}



// Title 
String? validateTechnologyTitle(String? value) {
  if ((value ?? "").isEmpty) {
    return 'title is required';
  }
  if (value!.length < 3) {
    return 'Title must be at least 3 characters long';
  }
  if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
    return 'Title can only contain letters and spaces';
  }
  return null;
}


//Referral Code
String? validReferralCode(String? value) {
  if ((value ?? "").isEmpty) {
    return 'Referral code is required';
  }
  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value!)) {
    return 'Invalid Referral code';
  }
  return null;
}

