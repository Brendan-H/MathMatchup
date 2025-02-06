/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (messages_en.dart) Last Modified on 1/26/25, 3:05 PM
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
    "FiveMinutes": MessageLookupByLibrary.simpleMessage("5 Minutes"),
    "OneMinute": MessageLookupByLibrary.simpleMessage("1 Minute"),
    "TenMinutes": MessageLookupByLibrary.simpleMessage("10 Minutes"),
    "ThirtySeconds": MessageLookupByLibrary.simpleMessage("30 Seconds"),
    "TwoMinutes": MessageLookupByLibrary.simpleMessage("2 Minutes"),
    "aboutCreateGameWithSettings": MessageLookupByLibrary.simpleMessage(
      "You are about to create a game with the following settings:",
    ),
    "addition": MessageLookupByLibrary.simpleMessage("Addition"),
    "anErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "changeThemeMode": MessageLookupByLibrary.simpleMessage("Toggle Dark Mode"),
    "chooseGameSettings": MessageLookupByLibrary.simpleMessage(
      "Choose Game Settings",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "createGame": MessageLookupByLibrary.simpleMessage("Create Game"),
    "difficulty": MessageLookupByLibrary.simpleMessage("Difficulty"),
    "division": MessageLookupByLibrary.simpleMessage("Division"),
    "dontRememberYourPasswordOrHaventLoggedInBeforeClick":
        MessageLookupByLibrary.simpleMessage(
          "Don\'t remember your password or haven\'t logged in before? Click below to reset your password or set your password for the first time.",
        ),
    "easy": MessageLookupByLibrary.simpleMessage("Easy"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enterGamecode": MessageLookupByLibrary.simpleMessage("Enter Gamecode"),
    "enterName": MessageLookupByLibrary.simpleMessage("Enter Name"),
    "forgotPasswordFirstTimeLoginPasswordSet":
        MessageLookupByLibrary.simpleMessage(
          "Forgot Password / First Time Login Password Set",
        ),
    "gameCodeIsRequired": MessageLookupByLibrary.simpleMessage(
      "Game code is required",
    ),
    "gameCodeMustBe6Digits": MessageLookupByLibrary.simpleMessage(
      "Game code must be 6 digits",
    ),
    "goBackHome": MessageLookupByLibrary.simpleMessage("Go Back Home"),
    "hard": MessageLookupByLibrary.simpleMessage("Hard"),
    "impossible": MessageLookupByLibrary.simpleMessage("Impossible"),
    "joinGame": MessageLookupByLibrary.simpleMessage("Join Game"),
    "learnAboutOurFamilyPlansStartingAt250PerMonth":
        MessageLookupByLibrary.simpleMessage(
          "Learn about our family plans, starting at \$2.50 per month per child, on our website and engage with your child\'s learning journey in a fun way.",
        ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "multiplication": MessageLookupByLibrary.simpleMessage("Multiplication"),
    "nameIsRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "noQuestionsAvailable": MessageLookupByLibrary.simpleMessage(
      "No Questions Available",
    ),
    "notChosen": MessageLookupByLibrary.simpleMessage("Not Chosen"),
    "parentsStartHere": MessageLookupByLibrary.simpleMessage(
      "Parents, start here",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "pleaseEnterYourSchoolEmailAndPasswordToLogin":
        MessageLookupByLibrary.simpleMessage(
          "Please enter your school email and password to login.",
        ),
    "points": MessageLookupByLibrary.simpleMessage("Points:"),
    "questionType": MessageLookupByLibrary.simpleMessage("Question Type"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "selectDifficulty": MessageLookupByLibrary.simpleMessage(
      "Select Difficulty",
    ),
    "selectQuestionType": MessageLookupByLibrary.simpleMessage(
      "Select Question Type",
    ),
    "selectTimeLimit": MessageLookupByLibrary.simpleMessage(
      "Select Time Limit",
    ),
    "sendPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
      "Send Password Reset Email",
    ),
    "startGame": MessageLookupByLibrary.simpleMessage("Start Game"),
    "studentsCanPlaySoloGamesForFreeEitherCreateA":
        MessageLookupByLibrary.simpleMessage(
          "Students can play solo games for free. Either create a solo game or join your class game with a game code provided by your teacher.",
        ),
    "studentsStartHere": MessageLookupByLibrary.simpleMessage(
      "Students, start here",
    ),
    "subtraction": MessageLookupByLibrary.simpleMessage("Subtraction"),
    "teacherLogin": MessageLookupByLibrary.simpleMessage("Teacher Login"),
    "teachersCanCreateGamesTrackProgressAndMoreGetStarted":
        MessageLookupByLibrary.simpleMessage(
          "Teachers can create games, track progress, and more. Get started by logging in or creating an account with your *school* email after your administrator has purchased a license.",
        ),
    "teachersStartHere": MessageLookupByLibrary.simpleMessage(
      "Teachers, start here",
    ),
    "timeLimit": MessageLookupByLibrary.simpleMessage("Time Limit"),
    "timeRemainingRemainingtimeSeconds": m0,
    "timesUp": MessageLookupByLibrary.simpleMessage("Time\'s Up!"),
    "waitForYourStudentsToFinish": MessageLookupByLibrary.simpleMessage(
      "Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted",
    ),
    "welcomeTeacher": MessageLookupByLibrary.simpleMessage("Welcome, teacher!"),
    "welcomeToMathmatchup": MessageLookupByLibrary.simpleMessage("MathMatchup"),
    "whoWillYourTeammateBeYoullFindOutInRemainingtime": m1,
    "youScoredXPoints": m2,
  };
}
