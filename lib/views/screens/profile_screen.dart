import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/firebase.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    // QuerySnapshot for all user data
    // DocumentSnapshot for single user - it's called document in firestore database under collection name
    DocumentSnapshot userData = await firebaseFirestore
        .collection('users-list')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    setState(() {
      _name = userData.get('username');
      _email = userData.get('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_name"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async => await firebaseAuth.signOut(),
            child: const Text("Sign out")),
      ),
    );
  }
}
