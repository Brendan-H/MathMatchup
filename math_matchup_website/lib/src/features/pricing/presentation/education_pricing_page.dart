import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../header/presentation/header.dart';

class EducationPricingPage extends StatefulWidget {
  const EducationPricingPage({super.key});

  @override
  _EducationPricingPageState createState() => _EducationPricingPageState();
}

class _EducationPricingPageState extends State<EducationPricingPage> {
  late TextEditingController _numberController;
  double _sliderValue = 1;
  double _costPerTeacher = 2.99;

  void _calculateCost() {
    if (_sliderValue <= 250) {
      _costPerTeacher = 2.99;
    } else if (_sliderValue <= 500) {
      _costPerTeacher = 2.85;
    } else {
      _costPerTeacher = 2.75;
    }
  }

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
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children:  [
              const Header(),
              Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Column(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 50.0,
                          activeTickMarkColor: Theme.of(context).colorScheme.primaryContainer,
                          inactiveTickMarkColor: Theme.of(context).colorScheme.secondaryContainer,
                          thumbColor: Theme.of(context).colorScheme.primaryContainer,
                          overlayColor: Theme.of(context).colorScheme.secondaryContainer,
                          valueIndicatorColor: Theme.of(context).colorScheme.primaryContainer,
                          valueIndicatorTextStyle: Theme.of(context).textTheme.headlineSmall,
                          inactiveTrackColor: Colors.grey,
                        ),
                        child: Slider(
                          value: _sliderValue,
                          min: 1,
                          max: 1000,
                          divisions: 1000,
                          label: _sliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _sliderValue = value;
                              _calculateCost();
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Theme.of(context).colorScheme.primary),
                              ),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _numberController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'^([1-9][0-9]{0,2}|1000)$')), //allow 1-1000
                                    ],
                                    decoration: const InputDecoration(
                                      labelText: 'Number of teachers',
                                      contentPadding: EdgeInsets.all(20.0),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        _sliderValue = double.tryParse(value) ?? 1;
                                        _calculateCost();
                                      });
                                    },
                                  ),
                                  Text('Number of teachers: ${_sliderValue.round()},', style: Theme.of(context).textTheme.headlineMedium,),
                                  const SizedBox(height: 5,),
                                  Text('Cost per teacher: \$$_costPerTeacher per month', style: Theme.of(context).textTheme.headlineMedium,),
                                  const SizedBox(height: 5,),
                                  Text('Total cost per month: \$${(_costPerTeacher * _sliderValue).toStringAsFixed(2)} per month', style: Theme.of(context).textTheme.headlineMedium,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SelectableText("That's less than a cup of coffee per teacher per month!"
                                    " Purchasing a license helps us keep MathMatchup 100% ad-free and allows us to continue to develop new features and content!"
                                    " Your license will also give you access to in-depth analysis of every game, allowing you to track progress."
                                    " The best part? Students love playing MathMatchup! "
                                    "The unique structure of MathMatchup makes students work harder rather than relying on their partner to do all the work."
                                    " Students are more engaged and more likely to retain the information they learn."
                                    " MathMatchup is the best way to supplement your curriculum and keep students learning!", style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
                                const SizedBox(height: 20,),
                                Text("Ready to get started?", style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center),
                                const SizedBox(height: 20,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: () {context.go('/education/login');},
                                    child: Text("Purchase a license now!", style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}