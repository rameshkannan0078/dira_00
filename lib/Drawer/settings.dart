import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";
  bool _switchValue=true;
  bool _darkValue=true;

  @override
  Widget build(BuildContext context) {

    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Settings",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child:Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 600,
              child: Column(
                children: [
                  ///Adding CSC Picker Widget in app
                  CSCPicker(

                    showStates: true,


                    showCities: true,

                    ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                    flagState: CountryFlag.ENABLE,

                    ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.grey.shade300, width: 1)),

                    ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border: Border.all(color: Colors.grey.shade300, width: 1)),

                    ///placeholders for dropdown search field
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",

                    ///labels for dropdown
                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State",
                    cityDropdownLabel: "City",

                    defaultCountry: DefaultCountry.India,
                    currentCountry:countryValue,
                    currentCity: cityValue,
                    currentState: stateValue,




                    selectedItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),

                    dropdownHeadingStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),

                    dropdownItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),


                    dropdownDialogRadius: 10.0,


                    searchBarRadius: 10.0,


                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },


                    onStateChanged: (value) {
                      setState(() {
                        var pass=value;
                        ///store value in state variable
                        stateValue = pass;
                      });
                    },

                    ///triggers once city selected in dropdown
                    onCityChanged: (value) {
                      setState(() {
                        var good=value;
                        ///store value in city variable
                        cityValue = good;
                      });
                    },
                  ),

                  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:Container(
                        width: 200,
                        color:Colors.white,
                        child:OutlinedButton(
                          onPressed: () {},
                          child: Text('Submit'),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("Manage Notifications",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing: CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("Change Mobile Number",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("Data Privacy",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing:Icon(
                        Icons.privacy_tip,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("User Agreement",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing:Icon(
                        Icons.notes,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("Terms and Condition",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing: Icon(
                        Icons.assignment_turned_in_outlined,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      tileColor: Colors.white,
                      title: Text("Dark Mode",style:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      trailing: CupertinoSwitch(
                        value:_darkValue,
                        onChanged: (value) {
                          setState(() {
                            _darkValue= value;
                          });
                        },
                      ),
                    ),
                  ),







                ],
              )
          ),
        ),
      )
    );
  }
}
