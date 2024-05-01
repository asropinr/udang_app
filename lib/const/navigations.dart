import 'package:flutter/material.dart';

class Navigations {
  goTo(context, screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
