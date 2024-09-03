import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

createAdminAccount(String email, String name, String school, String password) async {
  try {
   UserCredential account = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   account.user?.updateDisplayName(name);
   await account.user?.reload();
   User? updatedUser = FirebaseAuth.instance.currentUser;
   var uid = updatedUser?.uid;

  } on FirebaseAuthException catch (e) {
    print(e);
  }


  //make firebase account then add to spring backend database
}