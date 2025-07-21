/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (custom_dropdown.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/features/game_settings_page/presentation/game_settings_page.dart';

import '../app.dart';

/// Custom dropdown used for the language selection in the [GameSettingsPage]
class CustomDropdown extends ConsumerStatefulWidget {
  final Map<Locale, String> items;
  final Locale selectedItem;

  const CustomDropdown({super.key, required this.items, required this.selectedItem});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends ConsumerState<CustomDropdown> {
  late Locale dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton<Locale>(
        onSelected: (Locale locale) {
          setState(() {
            dropdownValue = locale;
          });
          ref.read(localeProvider.notifier).state = locale;
        },
        itemBuilder: (BuildContext context) {
          return widget.items.entries.map((entry) {
            return PopupMenuItem<Locale>(
              value: entry.key,
              child: SizedBox(
                width: 80,
                child: Text(entry.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
            );
          }).toList();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: 75,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(dropdownValue.languageCode.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}