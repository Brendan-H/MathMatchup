/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (messages_es.dart) Last Modified on 6/24/24, 7:42 PM
 *
 */

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(remainingTime) =>
      "Tiempo restante: ${remainingTime} segundos";

  static String m1(remainingTime) =>
      "¿Quién será tu compañero de equipo? Lo descubrirás en: ${remainingTime}";

  static String m2(points) =>
      "¡Has conseguido ${points} puntos! ¡Buen trabajo! Mira la pantalla de tu profesor para ver los resultados";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Ocurrió un error"),
        "changeThemeMode":
            MessageLookupByLibrary.simpleMessage("Cambiar a modo oscuro"),
        "chooseGameSettings": MessageLookupByLibrary.simpleMessage(
            "Elige la configuración del juego"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continuar"),
        "createGame": MessageLookupByLibrary.simpleMessage("Crear juego"),
        "enterGamecode":
            MessageLookupByLibrary.simpleMessage("Introducir código de juego"),
        "enterName": MessageLookupByLibrary.simpleMessage("Introducir nombre"),
        "gameCodeIsRequired":
            MessageLookupByLibrary.simpleMessage("Se requiere código de juego"),
        "gameCodeMustBe6Digits": MessageLookupByLibrary.simpleMessage(
            "El código de juego debe tener 6 dígitos"),
        "joinGame": MessageLookupByLibrary.simpleMessage("Unirse al juego"),
        "nameIsRequired":
            MessageLookupByLibrary.simpleMessage("Se requiere nombre"),
        "noQuestionsAvailable": MessageLookupByLibrary.simpleMessage(
            "No hay preguntas disponibles"),
        "points": MessageLookupByLibrary.simpleMessage("Puntos:"),
        "startGame": MessageLookupByLibrary.simpleMessage("Iniciar juego"),
        "timeRemainingRemainingtimeSeconds": m0,
        "timesUp": MessageLookupByLibrary.simpleMessage("¡Se acabó el tiempo!"),
        "waitForYourStudentsToFinish": MessageLookupByLibrary.simpleMessage(
            "Espera a que tus estudiantes terminen el juego y presiona el botón OK antes de continuar o sus puntuaciones no se contarán"),
        "welcomeToMathmatchup":
            MessageLookupByLibrary.simpleMessage("Bienvenido a MathMatchup"),
        "whoWillYourTeammateBeYoullFindOutInRemainingtime": m1,
        "youScoredXPoints": m2
      };
}
