/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (join_button_controller.dart) Last Modified on 7/20/25, 7:52 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matchup_core/matchup_core.dart';
import '../../../../generated/l10n.dart';
import '../repository/join_game.dart';
import '../domain/input_validation.dart';

Future<void> handleJoinGame({
  required WidgetRef ref,
  required BuildContext context,
  required TextEditingController gameCodeController,
  required TextEditingController nameController,
  required void Function(String?, String?) onValidationError,
}) async {
  final gameCodeError = validateGameCode(context, gameCodeController.text);
  final nameError = validateName(context, nameController.text);

  if (gameCodeError != null || nameError != null) {
    // Input validation failed, show error messages
    onValidationError(gameCodeError, nameError);

    await showExceptionAlertDialog(
      context: context,
      title: S.of(context).anErrorOccurred,
      exception: gameCodeError ?? nameError!,
    );
    return;
  }

  joinGame(gameCodeController.text, nameController.text, context, ref);
}

//    String? gameCodeError = validateGameCode(context, gameCodeController.text);
//                       String? nameError = validateName(context, nameController.text);
//
//                       ref.read(gameCodeProvider.notifier).state = gameCodeController.text;
//                       print("Code:${ref.read(gameCodeProvider.notifier).state}");
//                       _onJoinGamePressed(gameCodeController.text, nameController.text, context);
/*
 void _onJoinGamePressed(String gamecode, String name, BuildContext context) async {
    String? gameCodeError = validateGameCode(context, gameCodeController.text);
    String? nameError = validateName(context, nameController.text);

    if (gameCodeError != null || nameError != null) {
      // Input validation failed, show error messages
      setState(() {
        _gameCodeError = gameCodeError;
        _nameError = nameError;
      });
      if (_gameCodeError!.isNotEmpty) {
        showExceptionAlertDialog(context: context, title: S.of(context).anErrorOccurred, exception: _gameCodeError);
      } else if (_nameError!.isNotEmpty) {
        showExceptionAlertDialog(context: context, title: S.of(context).anErrorOccurred, exception: _nameError);
      }

    } else {
       joinGame(gameCodeController.text, nameController.text, context, ref);
    }
  }
 */