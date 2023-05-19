import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<Object?> getUserRecord() async {
  DocumentSnapshot documentSnapshot =
      await users.doc(FirebaseAuth.instance.currentUser!.uid).get();

  if (!documentSnapshot.exists) {
    return null;
  }

  return documentSnapshot.data()!;
}

Future<void> updateUserRecord(String userName, String firstName,
    String lastName, String email, String date, String password) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'userName': userName,
    'firstName': firstName,
    'lastName': lastName,
    'dateOfBirth': date,
  });
}
