import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup_website/src/features/header/presentation/header.dart';
class EducationPurchasePage extends ConsumerStatefulWidget {
  const EducationPurchasePage({super.key});

  @override
  ConsumerState createState() => _EducationPurchasePageState();
}

class _EducationPurchasePageState extends ConsumerState<EducationPurchasePage> {
  late TextEditingController _numberController;

  @override
  void initState() {
    _numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              const Header(),
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {context.go('/');},
                        child: Text("Home", style: Theme.of(context).textTheme.displayLarge,)),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: TextField(
                          controller: _numberController,
                          decoration: const InputDecoration(
                            labelText: 'Number of Teachers',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          final int numberOfTeachers = int.parse(_numberController.text);
                             //             ref.read(numberOfTeachersProvider).state = numberOfTeachers;
                            //              ref.read(educationPurchaseProvider.notifier).purchase();
                        },
                        child: const Text('Purchase'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
