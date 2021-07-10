import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.cover,
            ),
            Text(
              'Welcome $name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Username', labelText: 'Username'),
                    onChanged: (value) {
                      name = value;
                      setState(
                          () {}); //reloads the build method, i.e refreshes the state, only works for stateful widgets
                    },
                  ),
                  TextFormField(
                    obscureText: true, //hides the passsword
                    decoration: InputDecoration(
                        hintText: 'Enter Password', labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () async {
                      setState(() {
                      change = true;
                      });
                      
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: change ? 100: 150, // here, ? is the conditional expression which is given 
                      //if the boolean data type tends to be true. the statement change ? 50 : 150 means that if the condition
                      // is false then the width of the box will be 150 and likewise if the condition is false then the width will be 100

                      height: 40,
                      alignment: Alignment.center,
                      child: change ? Icon(Icons.done, color: Colors.white): Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      decoration: BoxDecoration(
                        // shape: change? BoxShape.circle: BoxShape.rectangle,
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular( change ?20: 4),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   child: Text('Login'),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
