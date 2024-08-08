
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup_website/src/features/about/presentation/about.dart';
import 'package:math_matchup_website/src/features/header/presentation/header.dart';
import 'package:math_matchup_website/src/features/pricing/presentation/pricing.dart';

import '../../../common_widgets/navbar.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
            () {
          setState(
                () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          children:   [
            const Header(),
            Navbar().desktopNavBar(ref),
            const About(),
            const Pricing(),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton ? FloatingActionButton(
        onPressed: () { _scrollToTop(); },
        child: const Icon(Icons.arrow_upward),
      ) : null,
    );
  }
}
