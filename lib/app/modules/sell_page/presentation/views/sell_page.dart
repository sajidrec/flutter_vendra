import 'package:flutter/material.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: Column(children: [Text("Sell")])),
      ),
    );
  }
}
