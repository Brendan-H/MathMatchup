/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (messages_es.dart) Last Modified on 9/13/24, 12:33 PM
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
        "FiveMinutes": MessageLookupByLibrary.simpleMessage("5 minutos"),
        "OneMinute": MessageLookupByLibrary.simpleMessage("1 minuto"),
        "TenMinutes": MessageLookupByLibrary.simpleMessage("10 minutos"),
        "ThirtySeconds": MessageLookupByLibrary.simpleMessage("30 segundos"),
        "TwoMinutes": MessageLookupByLibrary.simpleMessage("2 minutos"),
        "aboutCreateGameWithSettings": MessageLookupByLibrary.simpleMessage(
            "Estás a punto de crear un juego con las siguientes configuraciones:"),
        "addition": MessageLookupByLibrary.simpleMessage("Adición"),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Ocurrió un error"),
        "changeThemeMode":
            MessageLookupByLibrary.simpleMessage("Cambiar a modo oscuro"),
        "chooseGameSettings": MessageLookupByLibrary.simpleMessage(
            "Elige la configuración del juego"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continuar"),
        "createGame": MessageLookupByLibrary.simpleMessage("Crear juego"),
        "difficulty": MessageLookupByLibrary.simpleMessage("Dificultad"),
        "division": MessageLookupByLibrary.simpleMessage("División"),
        "dontRememberYourPasswordOrHaventLoggedInBeforeClick":
            MessageLookupByLibrary.simpleMessage(
                "¿No recuerdas tu contraseña o no has iniciado sesión antes? Haz clic a continuación para restablecer tu contraseña o establecerla por primera vez."),
        "easy": MessageLookupByLibrary.simpleMessage("Fácil"),
        "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "enterGamecode":
            MessageLookupByLibrary.simpleMessage("Introducir código de juego"),
        "enterName": MessageLookupByLibrary.simpleMessage("Introducir nombre"),
        "forgotPasswordFirstTimeLoginPasswordSet":
            MessageLookupByLibrary.simpleMessage(
                "Olvidé la contraseña / Primer inicio de sesión, establecer contraseña"),
        "gameCodeIsRequired":
            MessageLookupByLibrary.simpleMessage("Se requiere código de juego"),
        "gameCodeMustBe6Digits": MessageLookupByLibrary.simpleMessage(
            "El código de juego debe tener 6 dígitos"),
        "goBackHome": MessageLookupByLibrary.simpleMessage(
            "Volver a la pantalla principal"),
        "hard": MessageLookupByLibrary.simpleMessage("Difícil"),
        "impossible": MessageLookupByLibrary.simpleMessage("Imposible"),
        "joinGame": MessageLookupByLibrary.simpleMessage("Unirse al juego"),
        "learnAboutOurFamilyPlansStartingAt250PerMonth":
            MessageLookupByLibrary.simpleMessage(
                "Conoce nuestros planes familiares, a partir de \$2.50 por mes por niño, en nuestro sitio web y participa en el viaje de aprendizaje de tu hijo de una manera divertida."),
        "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "medium": MessageLookupByLibrary.simpleMessage("Medio"),
        "multiplication":
            MessageLookupByLibrary.simpleMessage("Multiplicación"),
        "nameIsRequired":
            MessageLookupByLibrary.simpleMessage("Se requiere nombre"),
        "noQuestionsAvailable": MessageLookupByLibrary.simpleMessage(
            "No hay preguntas disponibles"),
        "notChosen": MessageLookupByLibrary.simpleMessage("No Elegido"),
        "parentsStartHere":
            MessageLookupByLibrary.simpleMessage("Los padres comienzan aquí"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "pleaseEnterYourSchoolEmailAndPasswordToLogin":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, introduce tu correo electrónico y contraseña de la escuela para iniciar sesión."),
        "points": MessageLookupByLibrary.simpleMessage("Puntos:"),
        "questionType":
            MessageLookupByLibrary.simpleMessage("Tipo de pregunta"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Restablecer contraseña"),
        "selectDifficulty":
            MessageLookupByLibrary.simpleMessage("Selecciona dificultad"),
        "selectQuestionType":
            MessageLookupByLibrary.simpleMessage("Seleccionar tipo"),
        "selectTimeLimit":
            MessageLookupByLibrary.simpleMessage("Selecciona limite"),
        "sendPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Enviar correo electrónico para restablecer contraseña"),
        "startGame": MessageLookupByLibrary.simpleMessage("Iniciar juego"),
        "studentsCanPlaySoloGamesForFreeEitherCreateA":
            MessageLookupByLibrary.simpleMessage(
                "Los estudiantes pueden jugar juegos en solitario de forma gratuita. Crea un juego en solitario o únete al juego de tu clase con un código de juego proporcionado por tu profesor."),
        "studentsStartHere": MessageLookupByLibrary.simpleMessage(
            "Los estudiantes comienzan aquí"),
        "subtraction": MessageLookupByLibrary.simpleMessage("Sustracción"),
        "teacherLogin": MessageLookupByLibrary.simpleMessage(
            "Inicio de sesión del profesor"),
        "teachersCanCreateGamesTrackProgressAndMoreGetStarted":
            MessageLookupByLibrary.simpleMessage(
                "Los profesores pueden crear juegos, seguir el progreso y más. Comienza iniciando sesión o creando una cuenta con tu correo electrónico de la escuela después de que tu administrador haya comprado una licencia."),
        "teachersStartHere": MessageLookupByLibrary.simpleMessage(
            "Los profesores comienzan aquí"),
        "timeLimit": MessageLookupByLibrary.simpleMessage("Límite de tiempo"),
        "timeRemainingRemainingtimeSeconds": m0,
        "timesUp": MessageLookupByLibrary.simpleMessage("¡Se acabó el tiempo!"),
        "waitForYourStudentsToFinish": MessageLookupByLibrary.simpleMessage(
            "Espera a que tus estudiantes terminen el juego y presiona el botón OK antes de continuar o sus puntuaciones no se contarán"),
        "welcomeTeacher":
            MessageLookupByLibrary.simpleMessage("¡Bienvenido, profesor!"),
        "welcomeToMathmatchup":
            MessageLookupByLibrary.simpleMessage("MathMatchup"),
        "whoWillYourTeammateBeYoullFindOutInRemainingtime": m1,
        "youScoredXPoints": m2
      };
}
