import 'package:flutter/material.dart';

class DelayPage extends StatefulWidget {
  const DelayPage({Key? key}) : super(key: key);


  @override
  State<DelayPage> createState() => _DelayPageState();
}

class _DelayPageState extends State<DelayPage> {
  @override
  Widget build(BuildContext context) {
    dynamic dkk=0;
    Future<int> async1() {
    return Future.delayed(const Duration(seconds: 240)).then((onValue) => dkk);
  }
    return Scaffold(
      body: Center(child: Row(
        children: [
          const Text('Onay Bekleniliyor'),
          Text(async1().toString()),
        ],
      )),
    );
  }
}