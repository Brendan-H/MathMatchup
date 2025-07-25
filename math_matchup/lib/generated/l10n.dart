/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (l10n.dart) Last Modified on 7/19/25, 9:43 PM
 *
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Toggle Dark Mode`
  String get changeThemeMode {
    return Intl.message(
      'Toggle Dark Mode',
      name: 'changeThemeMode',
      desc: '',
      args: [],
    );
  }

  /// `MathMatchup`
  String get welcomeToMathmatchup {
    return Intl.message(
      'MathMatchup',
      name: 'welcomeToMathmatchup',
      desc: '',
      args: [],
    );
  }

  /// `Join Game`
  String get joinGame {
    return Intl.message('Join Game', name: 'joinGame', desc: '', args: []);
  }

  /// `Enter Gamecode`
  String get enterGamecode {
    return Intl.message(
      'Enter Gamecode',
      name: 'enterGamecode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get enterName {
    return Intl.message('Enter Name', name: 'enterName', desc: '', args: []);
  }

  /// `Start Game`
  String get startGame {
    return Intl.message('Start Game', name: 'startGame', desc: '', args: []);
  }

  /// `Create Game`
  String get createGame {
    return Intl.message('Create Game', name: 'createGame', desc: '', args: []);
  }

  /// `Time's Up!`
  String get timesUp {
    return Intl.message('Time\'s Up!', name: 'timesUp', desc: '', args: []);
  }

  /// `Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted`
  String get waitForYourStudentsToFinish {
    return Intl.message(
      'Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted',
      name: 'waitForYourStudentsToFinish',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `No Questions Available`
  String get noQuestionsAvailable {
    return Intl.message(
      'No Questions Available',
      name: 'noQuestionsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Points:`
  String get points {
    return Intl.message('Points:', name: 'points', desc: '', args: []);
  }

  /// `Time Remaining: {remainingTime} seconds`
  String timeRemainingRemainingtimeSeconds(Object remainingTime) {
    return Intl.message(
      'Time Remaining: $remainingTime seconds',
      name: 'timeRemainingRemainingtimeSeconds',
      desc: '',
      args: [remainingTime],
    );
  }

  /// `You scored {points} points! Nice job! Look to your teacher's screen for the results`
  String youScoredXPoints(Object points) {
    return Intl.message(
      'You scored $points points! Nice job! Look to your teacher\'s screen for the results',
      name: 'youScoredXPoints',
      desc: '',
      args: [points],
    );
  }

  /// `Who will YOUR teammate be? You'll find out in: {remainingTime}`
  String whoWillYourTeammateBeYoullFindOutInRemainingtime(
    Object remainingTime,
  ) {
    return Intl.message(
      'Who will YOUR teammate be? You\'ll find out in: $remainingTime',
      name: 'whoWillYourTeammateBeYoullFindOutInRemainingtime',
      desc: '',
      args: [remainingTime],
    );
  }

  /// `Game code is required`
  String get gameCodeIsRequired {
    return Intl.message(
      'Game code is required',
      name: 'gameCodeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Game code must be 6 digits`
  String get gameCodeMustBe6Digits {
    return Intl.message(
      'Game code must be 6 digits',
      name: 'gameCodeMustBe6Digits',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameIsRequired {
    return Intl.message(
      'Name is required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Choose Game Settings`
  String get chooseGameSettings {
    return Intl.message(
      'Choose Game Settings',
      name: 'chooseGameSettings',
      desc: '',
      args: [],
    );
  }

  /// `Go Back Home`
  String get goBackHome {
    return Intl.message('Go Back Home', name: 'goBackHome', desc: '', args: []);
  }

  /// `Question Type`
  String get questionType {
    return Intl.message(
      'Question Type',
      name: 'questionType',
      desc: '',
      args: [],
    );
  }

  /// `Select Question Type`
  String get selectQuestionType {
    return Intl.message(
      'Select Question Type',
      name: 'selectQuestionType',
      desc: '',
      args: [],
    );
  }

  /// `Addition`
  String get addition {
    return Intl.message('Addition', name: 'addition', desc: '', args: []);
  }

  /// `Subtraction`
  String get subtraction {
    return Intl.message('Subtraction', name: 'subtraction', desc: '', args: []);
  }

  /// `Multiplication`
  String get multiplication {
    return Intl.message(
      'Multiplication',
      name: 'multiplication',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message('Division', name: 'division', desc: '', args: []);
  }

  /// `Difficulty`
  String get difficulty {
    return Intl.message('Difficulty', name: 'difficulty', desc: '', args: []);
  }

  /// `Easy`
  String get easy {
    return Intl.message('Easy', name: 'easy', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Hard`
  String get hard {
    return Intl.message('Hard', name: 'hard', desc: '', args: []);
  }

  /// `Impossible`
  String get impossible {
    return Intl.message('Impossible', name: 'impossible', desc: '', args: []);
  }

  /// `Select Difficulty`
  String get selectDifficulty {
    return Intl.message(
      'Select Difficulty',
      name: 'selectDifficulty',
      desc: '',
      args: [],
    );
  }

  /// `Time Limit`
  String get timeLimit {
    return Intl.message('Time Limit', name: 'timeLimit', desc: '', args: []);
  }

  /// `30 Seconds`
  String get ThirtySeconds {
    return Intl.message(
      '30 Seconds',
      name: 'ThirtySeconds',
      desc: '',
      args: [],
    );
  }

  /// `1 Minute`
  String get OneMinute {
    return Intl.message('1 Minute', name: 'OneMinute', desc: '', args: []);
  }

  /// `2 Minutes`
  String get TwoMinutes {
    return Intl.message('2 Minutes', name: 'TwoMinutes', desc: '', args: []);
  }

  /// `5 Minutes`
  String get FiveMinutes {
    return Intl.message('5 Minutes', name: 'FiveMinutes', desc: '', args: []);
  }

  /// `10 Minutes`
  String get TenMinutes {
    return Intl.message('10 Minutes', name: 'TenMinutes', desc: '', args: []);
  }

  /// `Select Time Limit`
  String get selectTimeLimit {
    return Intl.message(
      'Select Time Limit',
      name: 'selectTimeLimit',
      desc: '',
      args: [],
    );
  }

  /// `You are about to create a game with the following settings:`
  String get aboutCreateGameWithSettings {
    return Intl.message(
      'You are about to create a game with the following settings:',
      name: 'aboutCreateGameWithSettings',
      desc: '',
      args: [],
    );
  }

  /// `Not Chosen`
  String get notChosen {
    return Intl.message('Not Chosen', name: 'notChosen', desc: '', args: []);
  }

  /// `Don't remember your password or haven't logged in before? Click below to reset your password or set your password for the first time.`
  String get dontRememberYourPasswordOrHaventLoggedInBeforeClick {
    return Intl.message(
      'Don\'t remember your password or haven\'t logged in before? Click below to reset your password or set your password for the first time.',
      name: 'dontRememberYourPasswordOrHaventLoggedInBeforeClick',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Please enter your school email and password to login.`
  String get pleaseEnterYourSchoolEmailAndPasswordToLogin {
    return Intl.message(
      'Please enter your school email and password to login.',
      name: 'pleaseEnterYourSchoolEmailAndPasswordToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, teacher!`
  String get welcomeTeacher {
    return Intl.message(
      'Welcome, teacher!',
      name: 'welcomeTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Teacher Login`
  String get teacherLogin {
    return Intl.message(
      'Teacher Login',
      name: 'teacherLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Teachers, start here`
  String get teachersStartHere {
    return Intl.message(
      'Teachers, start here',
      name: 'teachersStartHere',
      desc: '',
      args: [],
    );
  }

  /// `Teachers can create games, track progress, and more. Get started by logging in or creating an account with your *school* email after your administrator has purchased a license.`
  String get teachersCanCreateGamesTrackProgressAndMoreGetStarted {
    return Intl.message(
      'Teachers can create games, track progress, and more. Get started by logging in or creating an account with your *school* email after your administrator has purchased a license.',
      name: 'teachersCanCreateGamesTrackProgressAndMoreGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Students, start here`
  String get studentsStartHere {
    return Intl.message(
      'Students, start here',
      name: 'studentsStartHere',
      desc: '',
      args: [],
    );
  }

  /// `Students can play solo games for free. Either create a solo game or join your class game with a game code provided by your teacher.`
  String get studentsCanPlaySoloGamesForFreeEitherCreateA {
    return Intl.message(
      'Students can play solo games for free. Either create a solo game or join your class game with a game code provided by your teacher.',
      name: 'studentsCanPlaySoloGamesForFreeEitherCreateA',
      desc: '',
      args: [],
    );
  }

  /// `Parents, start here`
  String get parentsStartHere {
    return Intl.message(
      'Parents, start here',
      name: 'parentsStartHere',
      desc: '',
      args: [],
    );
  }

  /// `Learn about our family plans, starting at $2.50 per month per child, on our website and engage with your child's learning journey in a fun way.`
  String get learnAboutOurFamilyPlansStartingAt250PerMonth {
    return Intl.message(
      'Learn about our family plans, starting at \$2.50 per month per child, on our website and engage with your child\'s learning journey in a fun way.',
      name: 'learnAboutOurFamilyPlansStartingAt250PerMonth',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Password Reset Email`
  String get sendPasswordResetEmail {
    return Intl.message(
      'Send Password Reset Email',
      name: 'sendPasswordResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password / First Time Login Password Set`
  String get forgotPasswordFirstTimeLoginPasswordSet {
    return Intl.message(
      'Forgot Password / First Time Login Password Set',
      name: 'forgotPasswordFirstTimeLoginPasswordSet',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
