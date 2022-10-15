import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IletisimPage extends StatefulWidget {
  const IletisimPage({super.key});

  @override
  State<IletisimPage> createState() => _IletisimPageState();
}

class _IletisimPageState extends State<IletisimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton.small(
        onPressed: () => Navigator.of(context).pop(),
        tooltip: 'geri',
        child: Icon(Icons.arrow_back_ios_new, color: Colors.pink, size: 30),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
