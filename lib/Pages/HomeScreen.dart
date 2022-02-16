import 'package:dira_00/Pages/HomePage.dart';
import 'package:dira_00/Pages/chatpage.dart';
import 'package:dira_00/Pages/search.dart';
import 'package:dira_00/Pages/Notification.dart';
import 'package:dira_00/Pages/Profile.dart';
import 'package:dira_00/Pages/Post.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage_Front(),
    Search(),
    Post(),
    Notification_page(),
    Profile(),

  ];





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        elevation: 8.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
          DrawerHeader(
              decoration: BoxDecoration(
               image:DecorationImage(
                 fit:BoxFit.cover,
                 image:NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Ripon_Building_Chennai.JPG/1200px-Ripon_Building_Chennai.JPG'),
               ),

              ),
            child: null,

      ),

            ListTile(
              title: const Text('Help Line'),
              trailing:Icon(Icons.phone),
              onTap: () {
                Navigator.pushNamed(context, '/helpline');
              },
            ),
            Divider(
              thickness:1,
            ),
            ListTile(
              title: const Text('Setting'),
    trailing:Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            Divider(
              thickness:1,
            ),

            ListTile(
              title: const Text('Help'),
              trailing:Icon(Icons.help),
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
            Divider(
              thickness:1,
            ),

            ListTile(
              title: const Text('About'),
              trailing:Icon(Icons.integration_instructions_outlined),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            Divider(
              thickness:1,
            ),
            ListTile(
              title: const Text('Log Out'),
              trailing:Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness:1,
            ),

          ],
        ),
      ),
      appBar:AppBar(
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title:Text("DiRa",style:TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,

        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child:GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>chatpage()),
                  );
                },
                child: Icon(
                  Icons.message,
                  color:Colors.black,// add custom icons also
                ),
              ),
          ),

        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric( vertical: 12),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 30,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              duration: Duration(milliseconds: 200),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon:Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.add_to_photos_rounded,
                  text: 'Post',
                ),
                GButton(
                  icon: Icons.notifications_active_outlined,
                  text: 'Notification',

                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),




    );
  }
}

