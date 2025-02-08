/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_login_page.dart) Last Modified on 1/26/25, 2:11 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/theme_provider.dart';
import '../../../utils/themes.dart';
import '../repository/create_user.dart';

class TeacherLoginPage extends ConsumerStatefulWidget {
  const TeacherLoginPage({super.key});

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
        title:  Text(S.of(context).teacherLogin),
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
               Text(S.of(context).welcomeTeacher, style: theme.textTheme.headlineLarge,),
              const SizedBox(height: 20),
               Text(S.of(context).pleaseEnterYourSchoolEmailAndPasswordToLogin, style: theme.textTheme.displayLarge,),
              const SizedBox(height: 20),
               const Text("Note: successfully logging in will redirect you to the homepage, where you will be able to press the \"Create Game\" button again to begin a game"),
              const SizedBox(height: 20),
               TextField(
                controller: emailController,
                decoration:  InputDecoration(
                  labelText: S.of(context).email,
                ),
              ),
              const SizedBox(height: 20),
               TextField(
                controller: passwordController,
                decoration:  InputDecoration(
                  labelText: S.of(context).password,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()  async{
                  await login(emailController.text, passwordController.text);
                  context.go('/');
                },
                child:  Text(S.of(context).login, style: Theme.of(context).textTheme.displayLarge,),
              ),
              const SizedBox(height: 20),
              Text(S.of(context).dontRememberYourPasswordOrHaventLoggedInBeforeClick, style: theme.textTheme.displaySmall,),
              TextButton(onPressed: ()  {context.go('/teacher_login/password_reset');}, child: Text(S.of(context).forgotPasswordFirstTimeLoginPasswordSet)),
            ],
          ),
        ),
      ),
    );
  }
}
