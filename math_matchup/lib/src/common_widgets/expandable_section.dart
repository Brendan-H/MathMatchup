/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (expandable_section.dart) Last Modified on 2/8/25, 3:42 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final String content;
  final String nextPage;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.content,
    required this.nextPage,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}
class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isExpanded ? MediaQuery.of(context).size.height / 3 : 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title, style: Theme.of(context).textTheme.headlineMedium),
              ),
              Expanded(
                child: _isExpanded
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                              child: Text(widget.content, style: Theme.of(context).textTheme.bodyLarge,),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .06,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.go(widget.nextPage);
                                },
                                child:  Text('Continue', style: Theme.of(context).textTheme.headlineSmall),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                turns: _isExpanded ? 0.5 : 0, // Rotates 180 degrees when expanded
                child: Icon(Icons.expand_more, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}