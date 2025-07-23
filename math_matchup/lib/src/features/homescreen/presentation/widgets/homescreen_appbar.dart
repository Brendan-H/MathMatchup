/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (homescreen_appbar.dart) Last Modified on 7/21/25, 8:50 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../generated/l10n.dart';

class HomescreenAppBar extends StatelessWidget implements PreferredSizeWidget {

  final WidgetRef ref;
  final List<Widget> actions;

  const HomescreenAppBar({
    super.key,
    required this.ref,
    required this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.of(ref.context).size.height * .085);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Builder(
            builder: (BuildContext innerContext) {
              return IconButton(icon: Icon(Icons.menu, color: theme.colorScheme.onPrimaryContainer, size: 30,), onPressed: () {Scaffold.of(innerContext).openDrawer();});
            }
        ),
        // child: IconButton(
        //   icon:  themeModeState == ThemeMode.light ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.dark_mode_outlined),
        //   onPressed: () {
        //     ref.read(themesProvider.notifier).changeTheme(themeModeState == ThemeMode.light);
        //   },
        // ),
      ),
      actions: actions,
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.05),
      toolbarHeight: MediaQuery.of(context).size.height * .085,
      title: Text(S.of(context).welcomeToMathmatchup, style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onPrimaryContainer,
      ),),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    );
  }

}
