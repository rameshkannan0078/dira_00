import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class description extends StatefulWidget {
  const description({Key? key}) : super(key: key);

  @override
  _descriptionState createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Description",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Container(
          width:MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),

                child: Container(
                    child: Row(
                      children: [

                        Icon(
                          Icons.perm_identity_outlined,
                          color: Colors.blue,
                          size: 32.0,
                        ),
                        Text('Anaymous Id - ${arg['Id'].toString()}',style:TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    )),
              ),
              arg['video']=='true' ?
              Container(
                height:300,
                width:MediaQuery.of(context).size.width,
                child: Chewie(
                  controller: ChewieController(
                    showControls: true,
                    aspectRatio: 5/5,
                    videoPlayerController: VideoPlayerController.network(arg['link'].toString()),
                    autoPlay: true,
                    looping: false,
                  ),
                ),
              ) :
                   Container(
                      height:300,

                      width:MediaQuery.of(context).size.width,
                      child: Image.network(arg['link'])
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
                                  setState((){
                                    _iconColor=Colors.green;
                                  });
                                },
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ink(
                              decoration:ShapeDecoration(
                                color: _iconColor,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.comment,
                                ),
                                iconSize: 32,
                                onPressed: () {
                                  setState(() {
                                    _iconColor = Colors.yellow;
                                  });
                                },
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Ink(
                              decoration:ShapeDecoration(
                                color: _iconColor,
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
              Text(arg['dept'].toString()
                ,style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,),

              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(arg['location'].toString(),style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.left,),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(arg['description'].toString(),style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.left,),
              )

            ],
          ),
        ),
      ),
    );
  }
}
