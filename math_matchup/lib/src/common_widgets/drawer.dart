/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (drawer.dart) Last Modified on 7/26/23, 12:25 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../utils/theme_provider.dart';


class CustomDrawer extends ConsumerWidget {
   CustomDrawer({super.key});

   final themeModeProvider = StateProvider<bool>((ref) {
     return true;
   });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);


    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
             // color: Theme.of(context).canvasColor,
            ),
            child: Center(
              child: Text(
                'MathMatchup',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return SwitchListTile(
                title: Text(S.of(context).changeThemeMode),
                  value: themeModeState == ThemeMode.dark, //false or true
                  onChanged: (value) {
                    ref.read(themesProvider.notifier).changeTheme(value);
                  });
            },
          ),
        ],
      ),

    );
  }
}