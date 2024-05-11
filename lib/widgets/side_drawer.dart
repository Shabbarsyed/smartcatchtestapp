import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../auth/auth.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../theme/theme.dart';
import 'logo.dart';
import 'map_widget.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  Future _getLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      bool permissionGranted = true;
    } else if (await Permission.location.request().isPermanentlyDenied) {
      throw ('location.request().isPermanentlyDenied');
    } else if (await Permission.location.request().isDenied) {
      throw ('location.request().isDenied');
      bool permissionGranted = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MaterialTheme.lightScheme()
                  .primary, // You can remove this line if you want the default color
            ),
            child: const Center(
              child: Logo(
                height: 75,
                width: 131,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text('Home'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Search'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => ReportMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.forum_rounded),
            title: Text('Forums'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => ReportMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.local_activity_rounded),
            title: Text('Activity'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => FoundMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Profile'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => FoundMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text('Safety Alerts'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => FoundMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.language_rounded),
            title: Text('Educational Resources'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => FoundMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_rounded),
            title: Text('Chats'),
            onTap: () => {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => FoundMissing(),
              //   ),
              // )
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,
                color: MaterialTheme.lightScheme().error),
            title: Text(
              'Logout',
              style: TextStyle(color: MaterialTheme.lightScheme().error),
            ),
            onTap: () {
              Auth().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Login(
                    isLoading: false,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
