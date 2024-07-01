 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:healtify/screens/profile/createProfile.dart';

class emailNotifier extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      const SnackBar(
        content: Text('Success'),
        
      );
    
    } catch (e) {
      SnackBar(
        content: Text('Error occured $e'),
      );
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      const SnackBar(
        content: Text('Success! login successful'),
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> checkUser() async {
    if (auth.currentUser != null) {
      Get.offAll(() => const CreatProfile());
    }
  }
   
 }
