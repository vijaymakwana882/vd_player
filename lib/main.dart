import 'package:flutter/material.dart';

import 'View/homepage.dart';

void main() {
  runApp(VdPlayer());
}

class VdPlayer extends StatefulWidget {
  const VdPlayer({super.key});

  @override
  State<VdPlayer> createState() => _VdPlayerState();
}

class _VdPlayerState extends State<VdPlayer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
