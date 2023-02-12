import 'package:flutter/material.dart';

class CokYakindaPage extends StatelessWidget {
  const CokYakindaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 235, 240),
              Color.fromARGB(255, 255, 235, 240),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 254, 248),
              Color.fromARGB(255, 255, 254, 248),
            ],
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 35, right: 15, bottom: 35),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.hourglass_top, size: 115),
                      const SizedBox(height: 20),
                      const Text('Çok Yakında ...',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
