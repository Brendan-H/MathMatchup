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
        "FiveMinutes": MessageLookupByLibrary.simpleMessage("5 Minutes"),
        "OneMinute": MessageLookupByLibrary.simpleMessage("1 Minute"),
        "TenMinutes": MessageLookupByLibrary.simpleMessage("10 Minutes"),
        "ThirtySeconds": MessageLookupByLibrary.simpleMessage("30 Seconds"),
        "TwoMinutes": MessageLookupByLibrary.simpleMessage("2 Minutes"),
        "aboutCreateGameWithSettings": MessageLookupByLibrary.simpleMessage(
            "You are about to create a game with the following settings:"),
        "addition": MessageLookupByLibrary.simpleMessage("Addition"),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "changeThemeMode":
            MessageLookupByLibrary.simpleMessage("Toggle Dark Mode"),
        "chooseGameSettings":
            MessageLookupByLibrary.simpleMessage("Choose Game Settings"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
        "createGame": MessageLookupByLibrary.simpleMessage("Create Game"),
        "difficulty": MessageLookupByLibrary.simpleMessage("Difficulty"),
        "division": MessageLookupByLibrary.simpleMessage("Division"),
        "easy": MessageLookupByLibrary.simpleMessage("Easy"),
        "enterGamecode": MessageLookupByLibrary.simpleMessage("Enter Gamecode"),
        "enterName": MessageLookupByLibrary.simpleMessage("Enter Name"),
        "gameCodeIsRequired":
            MessageLookupByLibrary.simpleMessage("Game code is required"),
        "gameCodeMustBe6Digits":
            MessageLookupByLibrary.simpleMessage("Game code must be 6 digits"),
        "goBackHome": MessageLookupByLibrary.simpleMessage("Go Back Home"),
        "hard": MessageLookupByLibrary.simpleMessage("Hard"),
        "impossible": MessageLookupByLibrary.simpleMessage("Impossible"),
        "joinGame": MessageLookupByLibrary.simpleMessage("Join Game"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "multiplication":
            MessageLookupByLibrary.simpleMessage("Multiplication"),
        "nameIsRequired":
            MessageLookupByLibrary.simpleMessage("Name is required"),
        "noQuestionsAvailable":
            MessageLookupByLibrary.simpleMessage("No Questions Available"),
        "notChosen": MessageLookupByLibrary.simpleMessage("Not Chosen"),
        "points": MessageLookupByLibrary.simpleMessage("Points:"),
        "questionType": MessageLookupByLibrary.simpleMessage("Question Type"),
        "selectDifficulty":
            MessageLookupByLibrary.simpleMessage("Select Difficulty"),
        "selectQuestionType":
            MessageLookupByLibrary.simpleMessage("Select Question Type"),
        "selectTimeLimit":
            MessageLookupByLibrary.simpleMessage("Select Time Limit"),
        "startGame": MessageLookupByLibrary.simpleMessage("Start Game"),
        "subtraction": MessageLookupByLibrary.simpleMessage("Subtraction"),
        "timeLimit": MessageLookupByLibrary.simpleMessage("Time Limit"),
        "timeRemainingRemainingtimeSeconds": m0,
        "timesUp": MessageLookupByLibrary.simpleMessage("Time\'s Up!"),
        "waitForYourStudentsToFinish": MessageLookupByLibrary.simpleMessage(
            "Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted"),
        "welcomeToMathmatchup":
            MessageLookupByLibrary.simpleMessage("MathMatchup"),
        "whoWillYourTeammateBeYoullFindOutInRemainingtime": m1,
        "youScoredXPoints": m2
      };
}
