import 'package:flutter/material.dart';
import 'package:snackautomat/screens/main_sreen/_widgets/display.dart';
import 'package:snackautomat/screens/main_sreen/_widgets/schau_fenster.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SchauFenster(), flex: 2),
        Expanded(child: Display(), flex: 1),
      ],
    );
  }
}
