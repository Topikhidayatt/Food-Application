import 'package:flutter/material.dart';
import 'package:food_application/pages/start_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Startpage(),
    ),
  );
}
