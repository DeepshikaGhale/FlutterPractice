import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool change = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
    setState(() {
      change = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      change = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                height: 10,
              ),
              Text(
                'To our page',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is empty.';
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty.';
                        } else if (value.length < 6) {
                          return 'Password length should be atleast 6';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      // shape: change? BoxShape.circle: BoxShape.rectangle,
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(change ? 20 : 4),
                      child: InkWell(
                        hoverColor: Colors.red,
                        onTap: () => moveToHome(
                            context), //short hand operand when you have to finish in 1 line and return value is null.
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: change
                              ? 100
                              : 150, // here, ? is the conditional expression which is given
                          //if the boolean data type tends to be true. the statement change ? 50 : 150 means that if the condition
                          // is false then the width of the box will be 150 and likewise if the condition is false then the width will be 100

                          height: 40,
                          alignment: Alignment.center,
                          child: change
                              ? Icon(Icons.done, color: Colors.white)
                              : Text('Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
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
      ),
    );
  }
}
