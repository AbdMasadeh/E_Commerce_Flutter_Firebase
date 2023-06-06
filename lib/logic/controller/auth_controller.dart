import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void signUpFirebase({
    required String firstName,
    required String lastName,
    required String email,
    required String date,
    required String password,
    required mobileNumber,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': date,
        'mobileNumber': mobileNumber,
      });
      update();
      Get.snackbar(
        "Signed Up successfully!",
        "Go to Login page",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed('/loginPage');
    } on FirebaseAuthException catch (e) {
      String title = e.code;
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInFirebase({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      getUserRecord();

      update();
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      Get.snackbar(
        "Signed Up successfully!",
        "Go to Login page",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed('/mainPage');
    } on FirebaseAuthException catch (e) {
      String title = e.code;
      String message;

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white.withOpacity(0.3),
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // void resetPassword(String email) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //
  //     update();
  //     Get.back();
  //   } on FirebaseAuthException catch (e) {
  //     String title = e.code;
  //     String message;
  //
  //     if (e.code == 'user-not-found') {
  //       message =
  //       ' Account does not exists for that $email.. Create your account by signing up..';
  //     } else {
  //       message = e.message.toString();
  //     }
  //     Get.snackbar(
  //       title,
  //       message,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } catch (error) {
  //     Get.snackbar(
  //       'Error!',
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  void signOutFirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      update();
      isSignedIn = false;
      authBox.remove("auth");

      Get.snackbar(
        "Signed out successfully!",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offNamed('/welcomePage');
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // void getUserInfo() async {
  //   try {
  //     final user = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(.user!.uid).get();
  //   } catch (error) {
  //
  //   }
  // }
}
