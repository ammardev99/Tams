import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tams/modules/blogs/blog_details.dart';
import 'package:tams/models/blog_model.dart';
import 'package:tams/modules/service/service_details.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/service.dart';
import 'package:tams/utili/formating.dart';

myBoxShadow() {
  return const BoxShadow(
    color: Color.fromARGB(15, 0, 0, 0),
    offset: Offset(0.0, 0), // Shadow position
    blurRadius: 1.0, // Shadow spread
    spreadRadius: 1.0, // Shadow size
  );
}

// myGradient() {
//   return const LinearGradient(
//     begin: Alignment.bottomLeft,
//     end: Alignment.topRight,
//     colors: [
//       Color(0xFF863FC1), // #863FC1
//       Color(0xFFE531E9), // #E531E9
//       Color(0xFFF53636), // #F53636
//     ],
//   );
// }

Widget coursePkg(
  String title,
  String img,
  BuildContext context,
  openPage,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: InkWell(
      hoverColor: Colors.white,
      splashColor: secondaryColor03,
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.white,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => openPage));
      },
      // main container
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width >= 360
              ? 370
              : MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: secondaryColor03),
            boxShadow: [myBoxShadow()],
          ),
          child: Row(
            children: [
              // Thumbnail
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor03),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Thumbnail end
              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading(title, secondaryColor),
                    const Text(
                        "Write an amazing description in this dedicated card section."),
                    const SizedBox(height: 8),
                    // SizedBox(child: pkgInfoIcons(5, 3.5, 25, 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey,
                )))
      ]),
    ),
  );
}

Widget showService(Service object, [List<Object>? list]) {
  return InkWell(
    hoverColor: Colors.white,
    splashColor: secondaryColor03,
    borderRadius: BorderRadius.circular(8),
    highlightColor: Colors.white,
    onTap: () {
      debugPrint('Open Service Info');

      Get.to(const ServiceDetails(), arguments: list);
    },
    child: Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: secondaryColor03),
          boxShadow: [myBoxShadow()],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            SizedBox(
                width: double.infinity,
                height: 160,
                child: Image.memory(
                  object.image,
                  fit: BoxFit.cover,
                )),
            // Thumbnail end
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizeBox(20, 10),
                heading(object.title, secondaryColor),
                sizeBox(20, 5),
                Row(
                  children: [
                    icontInfo(
                        Icons.person,
                        object.category == '1'
                            ? 'All'
                            : object.category == '2'
                                ? 'Female'
                                : 'Male'),
                    sizeBox(15, 15),
                    icontInfo(Icons.sunny_snowing, object.duration),
                    sizeBox(15, 15),
                    // icontInfo(Icons.date_range_outlined,
                    // object.startdate),
                    const Spacer(),
                    sizeBox(15, 15),
                    icontInfo(Icons.receipt_long_outlined,
                        object.price.toString(), Colors.red[300]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // Positioned(
      //     right: 0,
      //     child: IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.favorite_border_rounded,
      //           color: Colors.grey,
      //         ))
      //         )
    ]),
  );
}

Widget showBlog(Blog blog, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: InkWell(
      hoverColor: Colors.white,
      splashColor: secondaryColor03,
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.white,
      onTap: () {
        debugPrint('Open Service Info');

        Get.to(
          BlogDetailsScreen(blog: blog),
        );
      },
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: secondaryColor03),
            boxShadow: [myBoxShadow()],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heading(blog.title, secondaryColor),
                ],
              ),
              sizeBox(10),
              index % 2 == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          // width: 150,
                          height: 150,
                          child: Image.memory(
                            blog.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: blog.author,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight:
                                        150), // Adjust maxHeight as needed
                                child: Text(
                                  blog.memory,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: blog.author,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight:
                                        150), // Adjust maxHeight as needed
                                child: Text(
                                  blog.memory,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Flexible(
                        //   child: Text(
                        //     'by ${blog.author}: ${blog.memory}',
                        //     style: const TextStyle(
                        //         fontSize: 12, color: Colors.grey),
                        //     textAlign: TextAlign.justify,
                        //     softWrap: true,
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 9,
                        //   ),
                        // ),
                        const SizedBox(width: 10),
                        SizedBox(
                          // width: 150,
                          height: 150,
                          child: Image.memory(
                            blog.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
              sizeBox(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icontInfo(Icons.location_on_outlined, blog.location,
                      secondaryColor),
                  icontInfo(
                      Icons.calendar_month_outlined, blog.date, Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget pkgInfoIcons(int m, double r, int s, int f) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      labelIcon(m.toString(), Icons.menu_book),
      labelIcon(r.toString(), Icons.star),
      labelIcon(s.toString(), Icons.groups_2_rounded),
      labelIcon('3m', Icons.access_time),
      // labelIcon(f.toString(), Icons.favorite),
    ],
  );
}

Widget labelIcon(String txt, IconData icon) {
  return Row(
    children: [
      Text(
        txt,
        style: infoHeading(),
      ),
      sizeBox(5, 0),
      infoIcon(icon),
    ],
  );
}

Widget courseTopCard(String title, String subtitle, String img) {
  return Center(
      child: Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 12),
    width: 340,
    height: 130,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: myGradient(),
    ),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading1(title, Colors.white),
              subHeading(subtitle, Colors.white),
            ],
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.contain,
                )),
          )
        ]),
  ));
}

Widget moduleCard(
    String img, String title, String subtitle, BuildContext context,
    [course]) {
  return InkWell(
    splashColor: secondaryColor.withOpacity(0.3),
    borderRadius: BorderRadius.circular(8),
    highlightColor: Colors.white,
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => course));
    },
    child: Container(
      width: 340,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: secondaryColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage(img))),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.playlist_add_check_rounded,
          color: Color(0xffE531E9),
        ),
      ),
    ),
  );
}

Widget lessonCard(String title, String subtitle, BuildContext context,
    [course]) {
  return InkWell(
    splashColor: secondaryColor.withOpacity(0.3),
    borderRadius: BorderRadius.circular(8),
    highlightColor: Colors.white,
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => course));
    },
    child: Container(
      width: 340,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: secondaryColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          Icons.play_circle_fill_rounded,
          color: secondaryColor,
          size: 40,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.check_circle_outline_rounded,
          color: secondaryColor,
        ),
      ),
    ),
  );
}

Widget quizCard(String title, String subtitle) {
  return InkWell(
    splashColor: secondaryColor03,
    borderRadius: BorderRadius.circular(8),
    highlightColor: Colors.white,
    onTap: () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => course));
    },
    child: Container(
      width: 340,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: secondaryColor03),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          Icons.analytics_rounded,
          color: secondaryColor,
          size: 40,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.check_circle_outline_rounded,
          color: secondaryColor,
        ),
      ),
    ),
  );
}

Widget textBtton(String txt) {
  return TextButton(
    onPressed: () {},
    style: ButtonStyle(
      backgroundColor: primaryColorBtn(),
    ),
    child: Text(
      txt,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget notesCard(BuildContext context, String title, String subtitle,
    [Icon? icon]) {
  return InkWell(
    splashColor: secondaryColor03,
    highlightColor: Colors.white,
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: heading('Under Maintenance', Colors.black87),
        backgroundColor: Colors.grey[200],
        duration: const Duration(milliseconds: 200),
      ));
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: secondaryColor03)),
      ),
      child: ListTile(
        title: subHeading(title, Colors.black),
        subtitle: Text(subtitle),
        trailing: icon,
        iconColor: Colors.grey,
      ),
    ),
  );
}

Widget menuOption(Icon icon, String txt, BuildContext context, [page]) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: secondaryColor))),
    child: ListTile(
      hoverColor: secondaryColor03,
      splashColor: secondaryColor03,
      leading: icon,
      iconColor: page == null ? Colors.black12 : Colors.grey,
      title: subHeading(txt, page == null ? Colors.black12 : Colors.grey),
      trailing: Icon(
        Icons.chevron_right,
        color: page == null ? Colors.grey : secondaryColor03,
      ),
      onTap: () {
        page == null
            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: heading('Under Maintenance', Colors.grey),
                backgroundColor: Colors.grey[200],
                duration: const Duration(milliseconds: 200),
              ))
            : Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
      },
    ),
  );
}
