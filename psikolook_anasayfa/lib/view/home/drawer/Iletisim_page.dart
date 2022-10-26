import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IletisimPage extends StatefulWidget {
  const IletisimPage({super.key});

  @override
  State<IletisimPage> createState() => _IletisimPageState();
}

class _IletisimPageState extends State<IletisimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blurPage.png"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 215, 226).withOpacity(0.5)),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton.small(
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'geri',
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.pink, size: 30),
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      const Text(
                        'İLETİŞİM',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Card(
                    color: const Color.fromARGB(255, 92, 225, 230),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            InkWell(
                                child: new Text(
                                  'ppsikolook@gmail.com',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ), //psikolok gelecek de bakalim
                                onTap: () => launch('https://mail.google.com')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        ),
      ),
      /* child: Row(
        children: [
          FloatingActionButton.small(
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'geri',
            child: Icon(Icons.arrow_back_ios_new, color: Colors.pink, size: 30),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ],
      ), */
    );
  }
}
