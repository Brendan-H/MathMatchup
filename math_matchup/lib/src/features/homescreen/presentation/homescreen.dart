import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/common_widgets/drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameCodeController = TextEditingController();
    final nameController = TextEditingController();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: const Text("Welcome to MathMatchup"),
        centerTitle: true,
        elevation: 2,
      ),
      body:  SafeArea(
        minimum: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text("Join Game",
              style: TextStyle(
                fontSize: 32
              ),
              ),
            ),
        TextField(
          controller: gameCodeController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: "Enter Gamecode",
            border: OutlineInputBorder(),
          ),
        ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: ElevatedButton(
                  onPressed: () async {

                  },
                  child: const Text("Join Game")
              ),
            )
          ],
        ),
      ),
    );
  }
}