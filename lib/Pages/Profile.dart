import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage:
                NetworkImage('https://img.dtnext.in/Articles/2020/Apr/202004290257407485_COVID-duty-TN-police-to-deploy-8500-freshers-before_SECVPF.gif'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
                child: SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(child: Text('AnanyMous Id :   10000020',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  )),
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: SizedBox(
                width:MediaQuery.of(context).size.width,
                height: 50,
                child: Center(child: Text('State :   Tamil Nadu',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: SizedBox(
                width:MediaQuery.of(context).size.width,
                height: 50,
                child: Center(child: Text('District :   Pudukkottai',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
        ],
      )
    );
  }
}
