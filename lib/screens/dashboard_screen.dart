import 'package:assignment_1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/listtile_widget.dart';

class DashBoardScreen extends StatefulWidget {
  static final String id = 'homescreen';

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _curruntIndex = 0;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get cureentUser => _firebaseAuth.currentUser;

  final tab = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Address"),
    ),
    Center(
      child: Text("Address"),
    ),
    Center(
      child: Text("Household"),
    ),
  ];

  Widget _userName() {
    return Text(cureentUser?.displayName ?? 'Name');
  }

  Widget _userId() {
    return Text(cureentUser?.email ?? 'User Email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black12,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                accountName: _userName(),
                accountEmail: _userId(),
              ),
            ),
            ListTileWidget(
                "Payment Method", "List Of Payment Methods", Icons.payment),
            ListTileWidget("Address", "Your Address", Icons.location_on),
            ListTileWidget("Password", "Your Password", Icons.password),
            ListTileWidget("House Hold", "HouseHold", Icons.house_outlined),
            ListTileWidget("Login", "Log Out", Icons.logout),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tab[_curruntIndex],
            ElevatedButton(
                onPressed: () {
                  _firebaseAuth.signOut();
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text('SignOut'))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curruntIndex,
        selectedItemColor: Colors.black,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Vendors',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lists',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            _curruntIndex = index;
          });
        },
      ),
    );
  }
}
