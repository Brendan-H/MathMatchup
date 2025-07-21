/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_creation_homepage.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../../common_widgets/expandable_section.dart';

class GameCreationHomepage extends ConsumerStatefulWidget {

  const GameCreationHomepage({super.key});

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
      body:  SingleChildScrollView(
        child: Column(
          children: [
           ExpandableSection(
              title: S.of(context).teachersStartHere,
              content: S.of(context).teachersCanCreateGamesTrackProgressAndMoreGetStarted,
              nextPage: '/teacher_login',
            ),
           ExpandableSection(
             title: S.of(context).studentsStartHere,
             content: S.of(context).studentsCanPlaySoloGamesForFreeEitherCreateA,
             nextPage: '/game/settings',
            ),
            ExpandableSection(
             title: S.of(context).parentsStartHere,
             content: S.of(context).learnAboutOurFamilyPlansStartingAt250PerMonth,
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

    
    
