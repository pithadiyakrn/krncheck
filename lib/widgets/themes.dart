import 'package:flutter/material.dart';

class Mytheme{

  static ThemeData lighttheme(BuildContext context) =>ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarTextStyle:Theme.of(context).textTheme.bodyText1,
        titleTextStyle:Theme.of(context).textTheme.bodyText1,

      )
  );
  static ThemeData darktheme(BuildContext context) =>ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: Colors.teal,
  );

  //colors
  static Color Cremcolor = Color(0xfff5f5f5);
  static Color darkBluishcolor = Color(0xff403b58);
}