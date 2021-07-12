import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final imageUrl = "data:image/jpeg;base64,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";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Username'),
              accountEmail: Text('someone@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text('Home',
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text('Profile',
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text('Inbox',
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
