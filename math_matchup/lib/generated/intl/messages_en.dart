/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (messages_en.dart) Last Modified on 7/27/23, 4:20 PM
 *
 */

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "changeThemeMode":
            MessageLookupByLibrary.simpleMessage("Toggle Dark Mode"),
        "createGame": MessageLookupByLibrary.simpleMessage("Create Game"),
        "enterGamecode": MessageLookupByLibrary.simpleMessage("Enter Gamecode"),
        "enterName": MessageLookupByLibrary.simpleMessage("Enter Name"),
        "joinGame": MessageLookupByLibrary.simpleMessage("Join Game"),
        "startGame": MessageLookupByLibrary.simpleMessage("Start Game"),
        "welcomeToMathmatchup":
            MessageLookupByLibrary.simpleMessage("Welcome to MathMatchup")
      };
}
