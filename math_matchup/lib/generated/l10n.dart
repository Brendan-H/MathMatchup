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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
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
    return Intl.message(
      'Join Game',
      name: 'joinGame',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Enter Name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Start Game`
  String get startGame {
    return Intl.message(
      'Start Game',
      name: 'startGame',
      desc: '',
      args: [],
    );
  }

  /// `Create Game`
  String get createGame {
    return Intl.message(
      'Create Game',
      name: 'createGame',
      desc: '',
      args: [],
    );
  }

  /// `Time's Up!`
  String get timesUp {
    return Intl.message(
      'Time\'s Up!',
      name: 'timesUp',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Points:',
      name: 'points',
      desc: '',
      args: [],
    );
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
      Object remainingTime) {
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
    return Intl.message(
      'Go Back Home',
      name: 'goBackHome',
      desc: '',
      args: [],
    );
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
