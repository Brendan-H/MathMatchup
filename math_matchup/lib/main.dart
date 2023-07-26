import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/firebase_options.dart';
import 'package:math_matchup/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(
     ProviderScope(
         observers: [
           Logger(),
         ],
      child: MyApp()
    ),
  );
}

final isDarkThemeProvider = StateProvider<bool>((ref) => false);

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}