
import 'package:flutter/material.dart';

class helpline extends StatefulWidget {
  const helpline({Key? key}) : super(key: key);

  @override
  _helplineState createState() => _helplineState();
}

class _helplineState extends State<helpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Helpline",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
      ),
      body:ListView(
        children:[
          Card(
            child: ListTile(
              title: Text("Cyber Crime Report",
                  style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
              ),
              subtitle: Text("155260"),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Bribary & Anti Corruption",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text('+91-44-22321090 '),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Civil Service Report",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text('(+91)22-6140-4300. '),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Consumer Care Rights",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text('+91 1800114000'),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
          Card(
            child: ListTile(
              title: Text("National Emergency",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("112"),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Police Emergency",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("100"),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Rail way Police",
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("182"),
              trailing: Icon(Icons.phone),
            ),
            elevation: 10,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(10),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          ),
        ]
      ),
    );
  }
}
