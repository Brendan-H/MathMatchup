import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
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
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Center(
              child: Text(
                'MathMatchup',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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