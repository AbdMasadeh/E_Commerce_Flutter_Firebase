import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');
final user = getUserRecord();
String? firstName;
String? lastName;
String? email;
String? mobileNumber;
String? dateOfBirth;

Future<Map<String, dynamic>> getUserRecord() async {
  DocumentSnapshot documentSnapshot =
      await users.doc(FirebaseAuth.instance.currentUser!.uid).get();

  Map<String, dynamic> user = documentSnapshot.data() as Map<String, dynamic>;
  firstName = user['firstName'];
  lastName = user['lastName'];
  dateOfBirth = user['dateOfBirth'];
  mobileNumber = user['mobileNumber'];
  email = FirebaseAuth.instance.currentUser!.email;
  return user;
}

Future<void> updateUserRecord(String userName, String firstName,
    String lastName, String email, String dateOfBirth) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'userName': userName,
    'firstName': firstName,
    'lastName': lastName,
    'dateOfBirth': dateOfBirth,
  });
}

String? getUserFirstName() {
  getUserRecord();
  return firstName;
}

String? getUserLastName() {
  return lastName;
}

String? getUserEmail() {
  return email;
}

String? getUserMobileNumber() {
  return mobileNumber;
}

String? getUserDateOfBirth() {
  return dateOfBirth;
}
