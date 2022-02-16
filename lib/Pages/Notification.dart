import 'package:flutter/material.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({Key? key}) : super(key: key);

  @override
  _Notification_pageState createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text("Action Taken"),
            subtitle: Text("Police are investigating your report and hope we will solve this problem"),
            trailing: Icon(Icons.stop_circle_outlined,
              color: Colors.green,
            ),
          ),
          Divider(
            thickness:2,
          ),
          ListTile(
            title: Text("Higher Crisis"),
            subtitle: Text("Serious problem going on this District"),
          ),
          Divider(
            thickness:2,
          ),
        ],
      ),


    );
  }
}
