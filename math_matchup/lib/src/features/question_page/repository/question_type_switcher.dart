/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (question_type_switcher.dart) Last Modified on 1/26/25, 3:56 PM
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../game_settings_page/presentation/game_settings_page.dart';
import '../data/addition_question.dart';
import '../data/question.dart';
import '../data/subtraction_question.dart';

 Question generateQuestion(WidgetRef ref) {
   var questionType = ref.read(selectedQuestionTypeProvider.notifier).state;

    if (questionType == 'Addition') {
      return generateAdditionQuestion(ref);
    } else if (questionType == 'Subtraction') {
      return generateSubtractionQuestion(ref);
    } else {
      return generateAdditionQuestion(ref);
    }
 }