import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        primary: false, 
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 22),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    children: [
                      FloatingActionButton.small(
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'geri',
                        child: Icon(Icons.arrow_back_ios_new, size: 30),
                        elevation: 0,
                        backgroundColor: Color(0xFF5CE1E6),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.hourglass_top_rounded, size: 100),
                    Text('Çok Yakında...'),
                  ],
                ),
                SizedBox(),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
