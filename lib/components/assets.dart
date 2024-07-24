import 'package:flutter/material.dart';
import 'package:tams/utili/formating.dart';

Color primaryColor = const Color(0xFF053365);
Color secondaryColor = const Color(0xFF249FFF);
Color secondaryColor03 = secondaryColor.withOpacity(0.3);
Color whiteColor = const Color(0xFFFfffff);

primaryColorBtn() {
  return WidgetStateProperty.all<Color>(
    const Color.fromRGBO(229, 49, 233, 0.25),
  );
}

Widget titleHeading(
  String txt,
  Color color,
) {
  return Text(
    txt,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
  );
}

Widget heading(
  String txt,
  Color color,
) {
  return Text(
    txt,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
  );
}

Widget subHeading(
  String txt,
  Color color,
) {
  return Text(
    txt,
    style: TextStyle(fontWeight: FontWeight.w500, color: color),
  );
}

Widget captionText(
  String txt,
  Color color,
) {
  return Text(
    txt,
    style: TextStyle(color: color),
  );
}


Widget textInfo(
  String txt,
  [Color? color]
) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 11,
      color: color??Colors.grey),
  );
}


Widget icontInfo(IconData icon,
  String txt,
  [Color? color]
) {
  return Row(
    children: [
      Icon(icon, size: 20, color:color??Colors.grey,),
      sizeBox(5, 5),
      Text(
        txt,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color:color??Colors.grey),
      ),
    ],
  );
}


TextStyle infoHeading() {
  return const TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.grey,
  );
}

Widget infoIcon(IconData icon) {
  return Icon(
    icon,
    color: Colors.grey,
    size: 20,
  );
}

InputDecoration inputStyle(IconData icon, String label, String hint) {
  return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: secondaryColor03,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      labelText: label,
      labelStyle: TextStyle(fontWeight: FontWeight.w500, color: secondaryColor),
      hintText: hint,
      hintStyle:
          const TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
      alignLabelWithHint: true, 
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: secondaryColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: secondaryColor),
      ),
      focusColor: secondaryColor,
      hoverColor: secondaryColor,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
      ));
}

// Widget sizeBox(double w, [double? h]) {
//   return SizedBox(
//     height: h??w,
//     width: w,
//   );
// }

myGradient() {
  return const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF053365), // #863FC1
      Color.fromARGB(255, 15, 92, 174), // #E531E9
      Color(0xFF249FFF), // #F53636
    ],
  );
}


Widget heading1(
  String txt,
  Color color,
) {
  return Text(
    txt,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
  );
}
