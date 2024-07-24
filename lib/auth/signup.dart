// import 'package:flutter/material.dart';
// import 'package:tams/auth/login.dart';
// import 'package:tams/components/assets.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   bool _showPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             sizeBox(0, 100),
//             titleHeading("Create you account", Colors.black),
//             captionText("You can create your account to access the admin panel",
//                 Colors.grey),
//             sizeBox(0, 50),
//             TextField(
//               decoration:
//                   inputStyle(Icons.person, "Full Name", "Enter your full name"),
//             ),
//             sizeBox(0, 20),
//             TextField(
//               decoration:
//                   inputStyle(Icons.email_rounded, "Email", "Enter your email"),
//             ),
//             sizeBox(0, 20),
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.lock,
//                   color: secondaryColor03,
//                 ),
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 labelText: "Password",
//                 labelStyle: TextStyle(
//                     fontWeight: FontWeight.w500, color: secondaryColor),
//                 hintText: "Enter your password",
//                 hintStyle: const TextStyle(
//                     fontWeight: FontWeight.normal, color: Colors.grey),
//                 alignLabelWithHint: true,
//                 suffix: InkWell(
//                   borderRadius: BorderRadius.circular(50),
//                   onTap: () {
//                     setState(() {
//                       _showPassword = !_showPassword;
//                     });
//                   },
//                   child: Icon(
//                     _showPassword ? Icons.visibility_off : Icons.visibility,
//                     color: secondaryColor03,
//                   ),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   borderSide: BorderSide(color: secondaryColor),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(color: secondaryColor)),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   borderSide: BorderSide(color: secondaryColor),
//                 ),
//                 focusColor: secondaryColor,
//                 hoverColor: secondaryColor,
//                 errorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.red),
//                 ),
//               ),
//               obscureText: _showPassword,
//             ),
//             sizeBox(0, 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 captionText("Do you have an account?", Colors.grey),
//                 sizeBox(10, 10),
//                 InkWell(
//                   onTap: () {
//                     // Get.to(const Login());
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => const Login()));
//                   },
//                   child: subHeading("Login", secondaryColor),
//                 )
//               ],
//             ),
//             sizeBox(0, 20),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _showSuccessDialog();
//                 },
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(320, 48),
//                     backgroundColor: secondaryColor),
//                 child: const Text('Sign up',
//                     style: TextStyle(color: Colors.white)),
//               ),
//             ),
//                         sizeBox(10, 40),
//           ],
//         ),
//       )),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             'Success!',
//             style: TextStyle(color: Colors.green),
//           ),
//           content: const Text('You have successfully signed up.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => const Login()));
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(color: secondaryColor),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
