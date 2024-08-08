import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/keys.dart';

class Pricing extends ConsumerWidget {
  const Pricing({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      key: Keys.pricingKey,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            SelectableText("Pricing", style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  width: 350,
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child: Column(
                      children: [
                        SelectableText("Student Pricing", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("100% FREE!", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Play games in class or at home", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Unlimited questions", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("No ads", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Cannot start games", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.red), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 350,
                  height: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child: Column(
                      children: [
                        SelectableText("Parent Pricing", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("\$1.99/month", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Start games", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Unlimited questions", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("No ads", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Sign up in app", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 350,
                  height: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child: Column(
                      children: [
                        SelectableText("Education Pricing", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Start games for your class", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Unlimited questions", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("No ads", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        SelectableText("Advanced Game Stats", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
                        const SizedBox(height: 20),
                        ElevatedButton(onPressed: () {}, child: const Text("View Education Pricing", style: TextStyle(color: Colors.black),))
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            )
          ]
        ),
      ),
    );
  }
}
