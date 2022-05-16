import 'package:ecommerce_app/utils/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  // function to sign up user
  Future<String> signUpUser(
      String fullName, String username, String email, String password) async {
    String res = 'some error occurred';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential userCred =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(userCred.user!.email);
        res = 'success';
      } else {
        res = 'fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
