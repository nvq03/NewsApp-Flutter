import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_login/model/user.dart';
import 'package:google_login/view/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

 class FirebaseService {

        final FirebaseAuth auth = FirebaseAuth.instance;
        Future<User?> get currentUser async => auth.currentUser;

    

    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  // Đăng ký người dùng
  Future<UserCredential?> registerWithEmailAndPassword(
      String username, String email, String password) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Lấy thông tin người dùng mới tạo
      User? user = userCredential.user;

      if (user != null) {
        // Tạo đối tượng Users với thông tin người dùng
        Users newUser = Users(
          username: username,
          email: email,
          password: password,
        );

        // Thêm dữ liệu vào Realtime Database
        final databaseRef = FirebaseDatabase.instance.ref('user/${user.uid}');
        await databaseRef.set(newUser.toJson());
      } else {
        // Xử lý trường hợp user là null
        print('Error: user object is null');
      }
    } catch (e) {
      print('Error registering user: $e');
      rethrow;
    }

    return userCredential;
  }

  // Đăng nhập người dùng
  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error signing in user: $e');
      rethrow;
    }

    return UserCredential;
  }

  Future<void> logout()async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }


}
