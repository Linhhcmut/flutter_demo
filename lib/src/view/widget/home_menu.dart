import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 30,
              color: Colors.lightBlue,
            ),
            title: Text(
              "My Profile",
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.history,
            size: 30,
            color: Colors.lightBlue,
          ),
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.money_off_csred_rounded,
            size: 30,
            color: Colors.lightBlue,
          ),
          title: Text("Offers",
              style: TextStyle(fontSize: 24, color: Colors.black54)),
        ),
        ListTile(
          leading: Icon(
            Icons.notifications_on_outlined,
            size: 30,
            color: Colors.lightBlue,
          ),
          title: Text(
            "Notifications",
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.help_outline_rounded,
            size: 24,
            color: Colors.lightBlue,
          ),
          title: Text(
            "Help & Support",
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            size: 24,
            color: Colors.lightBlue,
          ),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
        )
      ],
    );
  }
}
