import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/components/assets.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customRedirectOption(IconData icon, String txt, String url) {
  return Container(
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: primaryColor))),
    child: ListTile(
      hoverColor: primaryColor,
      leading: Icon(icon),
      title: heading(txt, Colors.black),
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch url';
        }
        print('fb');
      },
    ),
  );
}

Widget menuOptionLink(
    BuildContext context, IconData icon, String txt, String url) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: secondaryColor)),
    ),
    child: ListTile(
      hoverColor: secondaryColor03,
      splashColor: secondaryColor03,
      leading: Icon(icon),
      iconColor: secondaryColor,
      title: subHeading(txt, Colors.grey),
      trailing: Icon(
        Icons.chevron_right,
        color: secondaryColor03,
      ),
      onTap: () async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No internet connection.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ));
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Let\'s Go!',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w600),
                ),
                content: const Text('You need to open this page.'),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(secondaryColor03)),
                    onPressed: () async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Open',
                      style: TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    ),
  );
}

Widget menuOptionPage(
  BuildContext context,
  IconData icon,
  String txt,
  page,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: secondaryColor)),
    ),
    child: ListTile(
      hoverColor: secondaryColor03,
      splashColor: secondaryColor03,
      leading: Icon(icon),
      iconColor: secondaryColor,
      title: subHeading(txt, Colors.grey),
      trailing: Icon(
        Icons.chevron_right,
        color: secondaryColor03,
      ),
      onTap: () {
        Get.to(page);
      },
    ),
  );
}
