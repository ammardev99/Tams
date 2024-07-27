import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/modules/auth/login/view.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/widgets/buttons.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  String? getCurrentUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  String extractUsername(String email) {
    return email.split('@')[0];
  }

  @override
  Widget build(BuildContext context) {
    String? userEmail = getCurrentUserEmail();
    String? username =
        userEmail != null ? extractUsername(userEmail) : 'Company';

    return Scaffold(
        body: ListView(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: myGradient(),
              ),
              child: Center(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/logo.png",
                    ),
                  ),
                  title: heading('$username Agent', Colors.white),
                  subtitle: Text(
                    userEmail ?? 'useremail@gmail.com',
                    style: const TextStyle(
                      color: Colors.white,
                      // color: primaryColor,
                    ),
                  ),
                  // trailing: const Icon(
                  //   Icons.edit,
                  //   color: Color(0xFFffffff),
                  // ),
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const EditProfile()));
                  // },
                ),
              ),
            )),
        menuOptionLink(
            context,
            Icons.queue_play_next_outlined,
            'Cuztomize a tour',
            'https://travelagency-rho.vercel.app/home/contact'),
        menuOptionLink(context, Icons.open_in_browser_rounded, 'Visit website',
            'https://travelagency-rho.vercel.app/'),
        menuOptionLink(context, Icons.info_outline_rounded, 'About us',
            'https://travelagency-rho.vercel.app/home/about'),
        menuOptionLink(context, Icons.support_agent_rounded, 'Contact us',
            'https://travelagency-rho.vercel.app/home/contact'),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: secondaryColor))),
          child: ListTile(
            hoverColor: secondaryColor03,
            splashColor: secondaryColor03,
            leading: const Icon(Icons.logout),
            iconColor: Colors.red.shade400,
            title: subHeading("Logout", Colors.red.shade400),
            trailing: Icon(
              Icons.chevron_right,
              color: secondaryColor03,
            ),
            onTap: () {
              showDialog(
                // ignore: use_build_context_synchronously
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Log out!',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade400),
                    ),
                    content: const Text('Do you want to log out?'),
                    actions: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red.shade100)),
                        onPressed: () {
                          Navigator.pop(context);
                          Get.offAll(LoginPage());
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    ));
  }
}
