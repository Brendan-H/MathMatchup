/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_creation_homepage.dart) Last Modified on 7/31/24, 6:10 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/expandable_section.dart';

class GameCreationHomepage extends ConsumerStatefulWidget {

  const GameCreationHomepage({Key? key}) : super(key: key);

  @override
  _GameCreationHomepageState createState() => _GameCreationHomepageState();
}

class _GameCreationHomepageState extends ConsumerState<GameCreationHomepage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 2,
       leading: Padding(
         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
         child: IconButton(
           icon:  const Icon(Icons.arrow_back),
           onPressed: () {
             context.go('/');
           },
         ),
       ),
     ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
           ExpandableSection(
              title: "Teachers, start here",
              content: "Teachers can create games, track progress, and more. Get started by logging in or creating an account with your *school* email after your administrator has purchased a license.",
              nextPage: '/teacher_login',
            ),
           ExpandableSection(
             title: "Students, start here",
             content: "Students can play solo games for free. Either create a solo game or join your class game with a game code provided by your teacher.",
             nextPage: '/game/settings',
            ),
            ExpandableSection(
             title: "Parents, start here",
             content: "Learn about our family plans, starting at \$2.50 per month per child, on our website and engage with your child's learning journey in a fun way.",
             nextPage: '/login/parent',
           ),
          ],
        ),
      ),
  );
}
  @override
  void dispose() {
    super.dispose();
  }
}

    
    
