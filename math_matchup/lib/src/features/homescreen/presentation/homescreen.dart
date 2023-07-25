import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/common_widgets/textfield.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _gamecodecontroller = TextEditingController();
    final _namecontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to MathMatchup"),
        centerTitle: true,
        elevation: 2,
      ),
      body:  SafeArea(
        minimum: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text("Join Game",
              style: TextStyle(
                fontSize: 32
              ),
              ),
            ),
        TextField(
          controller: _gamecodecontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Enter Gamecode",
            border: const OutlineInputBorder(),
          ),
        ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: TextField(
                controller: _namecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: ElevatedButton(
                  onPressed: () async {

                  },
                  child: Text("Join Game")
              ),
            )
          ],
        ),
      ),
    );
  }
}