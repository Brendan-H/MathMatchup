import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:math_matchup_website/src/app.dart';
import 'package:math_matchup_website/src/utils/alert_dialogs.dart';
import 'package:math_matchup_website/src/utils/constants.dart';

createAdminAccount(String email, String name, String school, String role, String password, String confirmPassword) async {

  var context = navigatorKey.currentContext!;
  if (password != confirmPassword) {
    showAlertDialog(context: context, title: "Passwords must match", defaultActionText: "Okay");
  } else if (password.length < 6) {
    showAlertDialog(context: context, title: "Password must be at least 6 characters", defaultActionText: "Okay");
  } else if (email.isEmpty || name.isEmpty || school.isEmpty || role.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    showAlertDialog(context: context, title: "All fields must be filled", defaultActionText: "Okay");
  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
    showAlertDialog(context: context, title: "Invalid email format", defaultActionText: "Okay");
  } else if (name.length < 2) {
    showAlertDialog(context: context, title: "Please type your full name", defaultActionText: "Okay");
  }


  try {
    //create firebase user
   UserCredential account = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   account.user?.updateDisplayName(name);
   await account.user?.reload();
   User? updatedUser = FirebaseAuth.instance.currentUser;
   var uid = updatedUser?.uid;

   //add user to spring backend
   Dio dio = Dio();
   await dio.post('${Constants.backendurl}/users/create', data: {
     "uid": "$uid",
     "email": email,
     "isAdmin": true,
     "displayName": name,
     "role": role,
     "school": school
   });
   print("$uid $email $name $role $school");

  } on FirebaseAuthException catch (e) {
    print(e);
  }

}