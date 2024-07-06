import 'package:flutter/material.dart';
import 'package:tams/Screens/setting/edit_profile.dart';
import 'package:tams/Screens/socail_media.dart';
import 'package:tams/auth/login.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/components/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "assets/images/profile.jpg",
                    ),
                  ),
                  title: const Text(
                    "User Name",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text(
                    'usermail@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      // color: primaryColor,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.edit,
                    color: Color(0xFFffffff),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                ),
              ),
            )),
        // menuOption(
        //   const Icon(Icons.favorite_border_rounded),
        //   'My Favorite',
        //   context,
        // ),
        // menuOption(
        //   const Icon(Icons.assignment_outlined),
        //   'CV | Resume',
        //   context,
        // ),
        menuOption(
          const Icon(Icons.card_giftcard_rounded),
          'Donate',
          context,
        ),
        // menuOption(
        //   const Icon(Icons.history),
        //   'History',
        //   context,
        // ),
        menuOption(
          const Icon(
            Icons.support_agent_rounded,
          ),
          'Help',
          context,
        ),
        menuOption(
          const Icon(Icons.info_outline_rounded),
          'About us',
          context,
        ),
        menuOption(
            const Icon(
              Icons.account_tree_outlined,
            ),
            'Community',
            context,
            const SocailMedia()),
        // menuOption(
        //   const Icon(Icons.bookmark_add_outlined),
        //   'Add Course',
        //   context,
        //   const AddCourse()
        // ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: secondaryColor))),
          child: ListTile(
            hoverColor: secondaryColor03,
            splashColor: secondaryColor03,
            leading: const Icon(Icons.logout),
            iconColor: Colors.grey,
            title: subHeading("Logout", Colors.grey),
            trailing: Icon(
              Icons.chevron_right,
              color: secondaryColor03,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        )
      ],
    ));
  }
}
