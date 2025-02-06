/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (create_user.dart) Last Modified on 1/25/25, 11:33 PM
 *
 */

  import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/constants.dart';

  Future<void> createUser(String email, String password, String displayName) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
        var uid = user!.uid;
        print("email: $email, displayName: $displayName, uid: $uid");
        await sendUserToBackend(email, displayName, uid, "teacher");


      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
 }

 Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
 }

 Future<void> sendUserToBackend(String email, String displayName, String uid, String role) async {
   var backendUrl = Constants.backendurl;
   var dio = Dio();

    try {
      final response = await dio.post(
        "$backendUrl/users/create",
        queryParameters: {
          "email": email,
          "displayName": displayName,
          "uid": uid,
          "role": role,
        },
      );

      if (response.statusCode == 200) {
        print("User $displayName successfully created in the backend.");
      } else {
        // Handle other status codes if needed
        print("Error when creating user: ${response.data}");
      }
    } on DioException catch (e) {
      // Handle Dio specific errors
      if (e.response != null) {
        // DioError with a response from the server
        print("Error when creating user: ${e.response?.data}");
      } else {
        // DioError without a response from the server
        print("Error when creating user: ${e.message}");
      }
    } on Exception catch (e) {
      // Handle other general exceptions
      print("Error when creating user: ${e.toString()}");
    }
 }
