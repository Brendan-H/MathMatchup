/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (input_validation.dart) Last Modified on 7/20/25, 7:35 PM
 *
 */

import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

String? validateGameCode(BuildContext context, String value) {
  if (value.isEmpty) {
    return S.of(context).gameCodeIsRequired;
  } else if (value.length != 6 || int.tryParse(value) == null) {
    return S.of(context).gameCodeMustBe6Digits;
  }
  return null;
}

String? validateName(BuildContext context, String value) {
  if (value.isEmpty) {
    return S.of(context).nameIsRequired;
  }
  return null;
}