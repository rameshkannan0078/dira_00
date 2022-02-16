import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
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
        title: Text("About",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
      ),
      body:Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height:250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF05A22),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child:Image.asset('assets/about.png'),
                ),
    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Dira v1.0.0 ",style:TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )
                ),
              ),
              Text("   Contributed By    ",style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
              ),
              Text(" S.Ramesh Kannan",style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              )),
              Text(" A.Karuppiah",style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              Text("S.Sneha Sri",style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              Text("M.Selcia",style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Powered by ©2022 Copy Writes",style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
              )

            ],
          ),
      )
    );
  }
}
