

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final playersStreamProvider = StreamProvider.family<List<String>, String>((ref, gameCode) async* {
  final dio = Dio();
  var baseurl = Constants.backendurl;

  try {
    while (true) {
      print(gameCode);
      print("$baseurl/games/$gameCode/players");
      final response = await dio.get("$baseurl/games/$gameCode/players");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<String> players = data.map((playerData) => playerData['name'] as String).toList();
        yield players;
      }
      await Future.delayed(const Duration(seconds: 2)); // Adjust the delay to your requirements
    }
  } catch (error) {
    print('Error: $error');
  }
});