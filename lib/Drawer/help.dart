import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({Key? key}) : super(key: key);

  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {

  @override
  Widget build(BuildContext context) {
    final _feedbackMailController = TextEditingController();
    final _feedbackController = TextEditingController();
    Size _size2 = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Feedback",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _size2.height * 0.04,
            ),
            Center(
              child: Container(
                height: _size2.height * 0.09,
                width: _size2.width * 0.8,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  controller: _feedbackMailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "EMAIL",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size2.height * 0.04,
            ),
            Center(
              child: Container(
                width: _size2.width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: _feedbackController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Your FeedBack Here...",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size2.height * 0.04,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/feedback_submitted",
                );
              },
              label: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
