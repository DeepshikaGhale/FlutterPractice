import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Login Page",
        style: TextStyle(
          fontSize: 20,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),
        textScaleFactor: 1.0, // the value here multiplies with the fontSize
        ),
      ),
    );
  }
}