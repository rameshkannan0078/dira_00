import 'package:dira_00/Pages/chatScreen.dart';
import 'package:flutter/material.dart';


class chatpage extends StatefulWidget {
  const chatpage({Key? key}) : super(key: key);

  @override
  _chatpageState createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Private Chats"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>chatScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 2,),
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://cracku.in/latest-govt-jobs/wp-content/uploads/2019/04/TN-Police-Logo.png'),
                      maxRadius: 20,
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Tamil Nadu",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                          SizedBox(height: 6,),
                          Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                        ],
                      ),
                    ),
                    Icon(Icons.radio_button_checked_rounded,color: Colors.green,),
                  ],
                ),
              ),
            ),
          ),


          Divider(
            thickness:2,
          ),

        ],
      )
    );
  }
}


