// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor myColors = MaterialColor(
    0xff65737E, // 0% comes in here, this will be color picked if no shade is selected
    // when defining a Color property which does not require a swatch.
    <int, Color>{
      50: Color(0xffE8EBED), //10%
      100: Color(0xffD2D7DB), //20%
      200: Color(0xffBCC2C8), //30%
      300: Color(0xff9BA3AB), //40%
      400: Color(0xff7A8690), //50%
      500: Color(0xff65737E), //60%
      600: Color(0xff49535B), //70%
      700: Color(0xff373D43), //80%
      800: Color(0xff373D43), //90%
      900: Color(0xff1e2023), //100%
    },
  );
}


const primary = Color(0xff65737e);
const secondary = Color(0xff373D43);
const lightColor = Color(0xffBCC2C8);
const wWhiteColor = Colors.white;

class MyTextStyles {

  ///white colors ******************************

  static TextStyle sectionTitleLargeWhite = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle sectionTitleSmallWhite = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingLargeWhite = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingSmallWhite = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallBoldWhite = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallWhite = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );


  static TextStyle subHeadingWhite =
  TextStyle(color: Colors.white, fontSize: 14,);

  static TextStyle subHeadingBoldWhite = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle regularWhite = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  static TextStyle xSmallWhite = TextStyle(
    color: Colors.white,
    fontSize: 10,
  );

  ///Primary Colors********************************
  static TextStyle sectionTitleLargePrimary = TextStyle(
    color: primary,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle sectionTitleSmallPrimary = TextStyle(
    color: primary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingLargePrimary = TextStyle(
    fontSize: 20,
    color: primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingSmallPrimary = TextStyle(
    fontSize: 18,
    color: primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallBoldPrimary = TextStyle(
    fontSize: 16,
    color: primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallPrimary = TextStyle(
    fontSize: 16,
    color: primary,
  );

  static TextStyle subHeadingBoldPrimary = TextStyle(
    color: primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeadingPrimary = TextStyle(
    color: primary,
    fontSize: 14,
  );

  static TextStyle regularPrimary = TextStyle(
    fontSize: 12,
    color: primary,
  );

  static TextStyle xSmallPrimary = TextStyle(
    fontSize: 10,
    color: primary,
  );

// black ***********************

  static TextStyle SectionTitleLargeBlack = TextStyle(
    color: Colors.black,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle SectionTitleSmallBlack = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingLargeBlack = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingSmallBlack = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallBoldBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  static TextStyle subHeadingBoldBlack = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeadingBlack = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  static TextStyle regularBlack = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  static TextStyle xSmallBlack = TextStyle(
    color: Colors.black,
    fontSize: 10,
  );
//grey*************************************


  static TextStyle headingxSmallBoldGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingxSmallGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 16,
  );

  static TextStyle subHeadingBoldGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeadingGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 14,
  );

  static TextStyle regularGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 12,
  );

  static TextStyle xSmallGrey = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 10,
  );

}
