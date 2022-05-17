import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/utils/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController {
  // function to add image to storage
  _addImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profileImage')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // function to enable users to pick an image
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('no image selected');
    }
  }

  // function to sign up user
  Future<String> signUpUser(String fullName, String username, String email,
      String password, Uint8List? image) async {
    String res = 'some error occurred';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //..
        UserCredential userCred =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        String downloadUrl = await _addImageToStorage(image);

        await firebaseFirestore
            .collection('users-list')
            .doc(userCred.user!.uid)
            .set({
          'full-name': fullName,
          'username': username,
          'email': email,
          'image': downloadUrl,
        });

        // print(userCred.user!.email);
        res = 'success';
      } else {
        res = 'fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // ###############################################
  // function to login users
  loginUser(String email, String password) async {
    String res = 'some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'success';
        print('you are now logged in');
      } else {
        res = 'fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // ###############################################
  // function to reset user password
  resetPassword(String email) async {
    String res = 'some error occurred';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
        print('success send reset password to $email');
      } else {
        res = 'email must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
