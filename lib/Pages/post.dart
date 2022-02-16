
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  List<XFile>? _imageFileList;
  final _crime=TextEditingController();
  final _department=TextEditingController();
  final _location=TextEditingController();
  final _description=TextEditingController();
  String? _date;
  String? _time;
  File? filepath;
  File? ramesh;
  String? randomNumber;
  String? documentid;
  bool? typeofpath;


  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  Future<void> _playVideo(XFile? file) async {
    setState((){
      filepath=File(file!.path);
      typeofpath=false;
    });
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      await controller.setVolume(0);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }



  Future pickImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      ramesh =File(pickedFile!.path);
    });
  }



  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);


    } else {
            try {
              final pickedFile = await _picker.pickImage(
                source: source,
                maxWidth: 200,
                maxHeight: 300,
              );
              setState(() {
                _imageFile = pickedFile;
                typeofpath=true;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }



  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return Center(
        child: Text(
          'You have not yet picked a video',
          textAlign: TextAlign.center,
        ),
      );
    }
    return AspectRatioVideo(_controller);
  }

  Widget _previewImages() {
    if (_imageFileList != null) {
      return Image.file(File(_imageFileList![0].path));
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
          _imageFileList = response.files;


        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: _handlePreview(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller:_crime,
                decoration: InputDecoration(
                  labelText: "Type Of Crime",
                  fillColor: Colors.black12,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller:_location,
                decoration: InputDecoration(
                  labelText: "Location",
                  fillColor: Colors.black12,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller:_department,
                decoration: InputDecoration(
                  labelText: "Department",
                  fillColor: Colors.black12,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller:_description,
                maxLines:null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(

                  labelText: "Description",
                  fillColor: Colors.black12,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:Card (
                color: Colors.green[100],
                shadowColor: Colors.blueGrey,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    ListTile(
                      leading: Icon (
                          Icons.calendar_today,
                          color: Colors.cyan,
                          size: 35
                      ),

                      title:_date != null ? Text(_date.toString().substring(0,10)) :
                      Text("Date Not Selected",
                        style: TextStyle(fontSize: 20),),
                      onTap: (){
                        DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          maxTime: DateTime(2022, 6, 7),
                          theme: DatePickerTheme(
                              headerColor: Colors.orange,
                              backgroundColor: Colors.blue,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState((){
                              _date=date.toString();
                            });
                          },);
                      },
                    ),
                  ],
                ),
              ),


            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child:Card (
                color: Colors.green[100],
                shadowColor: Colors.blueGrey,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    ListTile(
                      leading: Icon (
                          Icons.access_time,
                          color: Colors.cyan,
                          size: 35
                      ),

                      title:_time != null ? Text(_time.toString().substring(10,16)) :
                      Text("Time Not Selected",
                        style: TextStyle(fontSize: 20),),
                      onTap: (){
                        DatePicker.showTimePicker(context, showTitleActions: true,
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState((){
                              _time=date.toString();
                            });
                          }, );
                      },
                    ),
                  ],
                ),
              ),


            ),




            Padding(
              padding: const EdgeInsets.all(15.0),
              child:ElevatedButton(
                child: Text("ElevatedButton"),
                onPressed: () async {
                  int min = 1000000; //min and max values act as your 7 digit range
                  int max = 9999999;
                  var randomizer = new Random();
                  var rNum = min + randomizer.nextInt(max - min);

                  setState((){
                    randomNumber=rNum.toString();
                  });

                  final firestoreInstance = FirebaseFirestore.instance;
                  firestoreInstance.collection('Pudukkottai').add({
                    "crime":_crime.text,
                    "location": _location.text,
                    "dept":_department.text,
                    "description":_description.text,
                    "date":_date.toString(),
                    "time":_time.toString(),
                    "id":rNum.toString(),
                    "link":"",
                    "video":''
                  }) .then((value) =>(
                      setState((){
                        documentid=value.id;
                  })));
                  if(typeofpath==true){
                    print(_imageFileList![0].path);
                    String image=_imageFileList![0].path;
                    Reference storage = FirebaseStorage.instance.ref('cool').child(documentid.toString());
                    final TaskSnapshot snapshot = await storage.putFile(File(image));
                    final downloadUrl = await snapshot.ref.getDownloadURL();
                    print(downloadUrl);
                    final firestoreInstance = FirebaseFirestore.instance;
                    firestoreInstance.collection('Pudukkottai').doc(documentid).update({
                      'link':downloadUrl,
                      "video":'false'
                    });
                  }
                  else{
                    String video=filepath!.path;
                    Reference storage = FirebaseStorage.instance.ref('cool').child(documentid.toString());
                    final TaskSnapshot snapshot = await storage.putFile(File(video));

                    final downloadUrl = await snapshot.ref.getDownloadURL();
                    print(downloadUrl);
                    final firestoreInstance = FirebaseFirestore.instance;
                    firestoreInstance.collection('Pudukkottai').doc(documentid).update({
                      'link':downloadUrl,
                      "video":'true'
                    });
                  }

                  Navigator.of(context).pushNamed('/homepage');


    },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                   fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),

                  ),
                ),
              ),
            ),


          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                pickImage();

              },
              heroTag: 'image1',
              tooltip: 'Pick Multiple Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image2',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
              heroTag: 'video0',
              tooltip: 'Pick Video from gallery',
              child: const Icon(Icons.video_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'video1',
              tooltip: 'Take a Video',
              child: const Icon(Icons.videocam),
            ),
          ),

        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }



}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: 5.0/5.0,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}