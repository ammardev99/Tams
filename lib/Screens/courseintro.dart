import 'package:flutter/material.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/utili/formating.dart';

class ServiceIntro extends StatefulWidget {
  const ServiceIntro({super.key});

  @override
  State<ServiceIntro> createState() => _ServiceIntroState();
}

class _ServiceIntroState extends State<ServiceIntro> {
  // final YoutubePlayerController _ycontroller =
  //     YoutubePlayerController(initialVideoId: '4CrY7sj0Shs');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          flexibleSpace:
              Container(decoration: BoxDecoration(gradient: myGradient())),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // YoutubePlayer(controller: _ycontroller),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/banner1.png',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: heading1("\nTour Title", Colors.black),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8),
              //   child: subHeading("By Ammar Shafiq", Colors.black),
              // ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. Write an amazing description in this dedicated card section. Each word counts. ",
                  textAlign: TextAlign.justify,
                ),
              ),
              sizeBox(10, 40),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => const Learning()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                        // gradient: myGradient()
                      ),
                      child: Center(child: heading("Order Now", Colors.white))),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  //   decoration: BoxDecoration(
                  //     gradient: myGradient(),
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  //   child: heading("Enroll This Course", Colors.white),
                  // ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
