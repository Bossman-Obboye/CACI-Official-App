import 'package:flutter/material.dart';

void main() {
  runApp(const CACApp());
}


class CACApp extends StatelessWidget {
  const CACApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HymnHome(),
    );
  }
}

class HymnHome extends StatelessWidget {
  const HymnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
