import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String id = 'homescreen';

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get cureentUser => _firebaseAuth.currentUser;

  Widget _userName() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(cureentUser?.displayName ?? 'Name'),
    );
  } Widget _userId() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(cureentUser?.email ?? 'User Email'),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userName(),
            _userId(),
            ElevatedButton(
                onPressed: () {
                  _firebaseAuth.signOut();
                  Navigator.pop(context);
                },
                child: Text('SignOut'))
          ],
        ),
      ),
    );
  }
}
