/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (custom_dropdown.dart) Last Modified on 6/25/24, 3:29 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';

class CustomDropdown extends ConsumerStatefulWidget {
  final Map<Locale, String> items;
  final Locale selectedItem;

  CustomDropdown({required this.items, required this.selectedItem});

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
      padding: EdgeInsets.all(8.0),
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
              child: Container(
                width: 200,
                child: Text(entry.value),
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
            child: Text(dropdownValue.languageCode.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}