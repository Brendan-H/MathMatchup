/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_creation_homepage.dart) Last Modified on 7/22/24, 4:33 PM
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
     ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
           ExpandableSection(
              title: "Teachers, start here",
              content: "Information about pricing for teachers. Teachers can create games, track progress, and more.",
              nextPage: '/login/teacher',
            ),
           ExpandableSection(
             title: "Students, start here",
             content: "Students can play and create games for free. Either create a game or join your class game with a game code provided by your teacher.",
             nextPage: '/game/settings',
            ),
            ExpandableSection(
             title: "Parents, start here",
             content: "Learn about our family plans. Engage with your child's learning journey.",
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

    
    
