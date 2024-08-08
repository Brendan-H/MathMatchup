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
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children:  [
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
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^([1-9][0-9]{0,2}|1000)$')),
              ],
              decoration: const InputDecoration(
                labelText: 'Number of teachers',
              ),
              onChanged: (String value) {
                setState(() {
                  _sliderValue = double.tryParse(value) ?? 1;
                  _calculateCost();
                });
              },

            ),
            Text('Number of teachers: ${_sliderValue.round()}'),
            Text('Cost per teacher: \$$_costPerTeacher per month'),
            Text('Total cost: \$${(_costPerTeacher * _sliderValue).toStringAsFixed(2)} per month'),
          ],
        ),
      ),
    );
  }
}
