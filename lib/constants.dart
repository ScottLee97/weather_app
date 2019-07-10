import 'package:flutter/material.dart';

const kTextfieldInputDecoration = InputDecoration(
    hintText: 'City Name',
    hintStyle: TextStyle(
        fontWeight: FontWeight.w300, color: Colors.white54, fontSize: 25));

const kTextFieldTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);

const kBackgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/flutter_starrynight.jpg'),
    fit: BoxFit.cover,
  ),
);
