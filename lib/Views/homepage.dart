import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = 'Home';

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text(
              "Are you sure you want to log out?"), // para sa logout confirmation
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToLoginScreen(context);
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // app title
        title: Text('FB APP NI KYLE'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //content image dito
                _buildImageWithIcons('lib/assets/image1.jpg'),
                _buildImageWithIcons('lib/assets/image2.avif'),
                _buildImageWithIcons('lib/assets/image3.jpg'),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // side navigation bar dito
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
              accountEmail: null,
              currentAccountPicture: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/pfp.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: _selectedOption == 'Home',
              onTap: () {
                setState(() {
                  _selectedOption = 'Home';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              selected: _selectedOption == 'Message',
              onTap: () {
                setState(() {
                  _selectedOption = 'Message';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              selected: _selectedOption == 'Notification',
              onTap: () {
                setState(() {
                  _selectedOption = 'Notification';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              selected: _selectedOption == 'Settings',
              onTap: () {
                setState(() {
                  _selectedOption = 'Settings';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              selected: _selectedOption == 'Logout',
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithIcons(String imagePath) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width *
              0.9, // image screen width to sya
          height: MediaQuery.of(context).size.height *
              0.3, // eto naman image screen height
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.mode_comment),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
