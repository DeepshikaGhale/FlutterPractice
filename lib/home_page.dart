import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = 'Deepshika';
  final int age = 19;
  final double salary = 0.0;
  final bool isMarried = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          title: Text('App'),
        ),
        body: Center(
          child: Container(
            child: Text(
            'My name is $name.'),
          ),
        ),
        drawer: Drawer(),
      )
    );
  }
}
