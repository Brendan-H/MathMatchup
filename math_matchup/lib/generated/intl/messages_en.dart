/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (messages_en.dart) Last Modified on 6/13/24, 10:48 AM
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

  static String m0(remainingTime) => "Time Remaining: ${remainingTime} seconds";

  static String m1(remainingTime) =>
      "Who will YOUR teammate be? You\'ll find out in: ${remainingTime}";

  static String m2(points) =>
      "You scored ${points} points! Nice job! Look to your teacher\'s screen for the results";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "changeThemeMode":
            MessageLookupByLibrary.simpleMessage("Toggle Dark Mode"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
        "createGame": MessageLookupByLibrary.simpleMessage("Create Game"),
        "enterGamecode": MessageLookupByLibrary.simpleMessage("Enter Gamecode"),
        "enterName": MessageLookupByLibrary.simpleMessage("Enter Name"),
        "gameCodeIsRequired":
            MessageLookupByLibrary.simpleMessage("Game code is required"),
        "gameCodeMustBe6Digits":
            MessageLookupByLibrary.simpleMessage("Game code must be 6 digits"),
        "joinGame": MessageLookupByLibrary.simpleMessage("Join Game"),
        "nameIsRequired":
            MessageLookupByLibrary.simpleMessage("Name is required"),
        "noQuestionsAvailable":
            MessageLookupByLibrary.simpleMessage("No Questions Available"),
        "points": MessageLookupByLibrary.simpleMessage("Points:"),
        "startGame": MessageLookupByLibrary.simpleMessage("Start Game"),
        "timeRemainingRemainingtimeSeconds": m0,
        "timesUp": MessageLookupByLibrary.simpleMessage("Time\'s Up!"),
        "waitForYourStudentsToFinish": MessageLookupByLibrary.simpleMessage(
            "Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted"),
        "welcomeToMathmatchup":
            MessageLookupByLibrary.simpleMessage("Welcome to MathMatchup"),
        "whoWillYourTeammateBeYoullFindOutInRemainingtime": m1,
        "youScoredXPoints": m2
      };
}
