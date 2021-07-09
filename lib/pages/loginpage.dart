import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'assets/images/login_image.png',
            fit: BoxFit.cover,
          ),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Username', labelText: 'Username'),
                ),
                TextFormField(
                  obscureText: true, //hides the passsword
                  decoration: InputDecoration(
                      hintText: 'Enter Password', labelText: 'Password'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text('Login'),
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    print('Hi Computer');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
