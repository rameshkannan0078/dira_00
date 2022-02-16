
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chewie/chewie.dart';

class HomePage_Front extends StatefulWidget {
  const HomePage_Front({Key? key}) : super(key: key);

  @override
  _HomePage_FrontState createState() => _HomePage_FrontState();
}

class _HomePage_FrontState extends State<HomePage_Front> {


  Color _iconColor = Colors.white;






  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Pudukkottai').get(),
        builder: buildUserList,
      ),
    );
  }




  Widget buildUserList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot doc = snapshot.data!.docs[index];
          if (doc['video']=='true') {
            return Container(
            height:470,
            width:MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap:(){
                      Navigator.of(context).pushNamed('/description',
                          arguments:{
                        "Id":doc['id'],
                         "link":doc['link'],
                            "dept":doc['dept'],
                            "location":doc['location'],
                            'description':doc['description'],
                            "video":doc['video'],
                      },
                      );
                    },
                    child: Container(
                        child: Row(
                          children: [

                            Icon(
                              Icons.perm_identity_outlined,
                              color: Colors.blue,
                              size: 32.0,
                            ),
                            Text('Anaymous Id - ${doc['id']}',style:TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  height:300,
                  width:MediaQuery.of(context).size.width,
                  child: Chewie(
                    controller: ChewieController(
                      showControls: true,
                      aspectRatio: 5/5,
                      videoPlayerController: VideoPlayerController.network(doc['link']),
                      autoPlay: false,
                      looping: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Ink(
                                decoration:ShapeDecoration(
                                  color:_iconColor,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                  ),
                                  iconSize: 32,
                                  onPressed: () {
                                    setState((){
                                      _iconColor==Colors.green?_iconColor=Colors.white:_iconColor=Colors.green;
                                    });
                                  },
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ink(
                                decoration:ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.comment,
                                  ),
                                  iconSize: 32,
                                  onPressed: () {
                                    setState(() {

                                    });
                                  },
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Ink(
                                decoration:ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.share,
                                  ),
                                  iconSize: 32,
                                  onPressed: () {
                                  },
                                )),
                          ),


                        ],
                      )),
                ),
                Text(doc['dept']
                  ,style:TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,),

                Divider(
                  thickness: 2,
                ),
              ],
            ),
          );
          } else {
            return Container(
                  height:450,
                  width:MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap:(){
                            Navigator.of(context).pushNamed('/description',
                              arguments:{
                                "Id":doc['id'],
                                "link":doc['link'],
                                "dept":doc['dept'],
                                "location":doc['location'],
                                'description':doc['description'],
                                "video":doc['video'],
                              },
                            );
                          },
                          child:Container(

                              child: Row(
                                children: [


                                  Icon(
                                    Icons.perm_identity_outlined,
                                    color: Colors.blue,
                                    size: 32.0,
                                  ),
                                  Text('Anaymous Id - ${doc['id']}',
                                    style:TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ),
                      Container(
                          height:300,
                          width:MediaQuery.of(context).size.width,
                          child: Image.network(doc['link'])
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Ink(
                                      decoration:ShapeDecoration(
                                        color: _iconColor,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                        ),
                                        iconSize: 32,
                                        onPressed: () {

                                        },
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Ink(
                                      decoration:ShapeDecoration(
                                        color: Colors.white,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.comment,
                                        ),
                                        iconSize: 32,
                                        onPressed: () {

                                        },
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Ink(
                                      decoration:ShapeDecoration(
                                        color:Colors.white,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.share,
                                        ),
                                        iconSize: 32,
                                        onPressed: () {
                                        },
                                      )),
                                ),


                              ],
                            )),
                      ),
                      Text(doc['dept'],style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                        textAlign: TextAlign.left,
                      ),

                    ],
                  )

            );
          }
        },
      );
    }
    else {
    // Still loading
    return Center(child: CircularProgressIndicator());
    }
  }

}

