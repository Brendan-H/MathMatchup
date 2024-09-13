/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_login_page.dart) Last Modified on 9/13/24, 10:45 AM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/theme_provider.dart';
import '../../../utils/themes.dart';
import '../repository/create_user.dart';

class TeacherLoginPage extends ConsumerStatefulWidget {
  const TeacherLoginPage({Key? key}) : super(key: key);

  @override
  _TeacherLoginPageState createState() => _TeacherLoginPageState();
}


class _TeacherLoginPageState extends ConsumerState<TeacherLoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController fullNameController;


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final themeModeState = ref.watch(themesProvider);
    final theme = themeModeState == ThemeMode.light ? ref.read(lightThemeProvider) : ref.read(darkThemeProvider);
    
    return Scaffold(
      appBar: AppBar(
        //back button
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon:  const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: const Text("Teacher Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
               Text("Welcome, teacher!", style: theme.textTheme.headlineLarge,),
              const SizedBox(height: 20),
               Text("Please enter your school email and password to login.", style: theme.textTheme.displayLarge,),
              const SizedBox(height: 20),
               TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 20),
               TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()  async{
                  await login(emailController.text, passwordController.text);
                },
                child:  Text("Login", style: Theme.of(context).textTheme.displayLarge,),
              ),
              SizedBox(height: 20),
              Text("Don't remember your password or haven't logged in before? Click below to reset your password or set your password for the first time.", style: theme.textTheme.displaySmall,),
              TextButton(onPressed: ()  {context.go('/teacher_login/password_reset');}, child: Text("Forgot Password / First Time Login Password Set")),
            ],
          ),
        ),
      ),
    );
  }
}
