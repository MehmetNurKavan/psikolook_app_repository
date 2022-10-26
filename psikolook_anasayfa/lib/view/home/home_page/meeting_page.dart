import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
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
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 215, 226).withOpacity(0.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton.small(
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'geri',
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.pink, size: 30),
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'ZOOM Linkini Kopyala',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        //height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Column(
                            children: [
                              const SizedBox(height: 100),
                              TextField(
                                keyboardType: TextInputType.none,
                                textInputAction: TextInputAction.none,
                                onChanged: (String deger) {
                                  if (deger.length > 3) {
                                    print(deger);
                                  }
                                },
                                onSubmitted: (String deger) {
                                  print("submit " + deger);
                                },
                                cursorColor: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 5, bottom: 5),
                              child: TextButton(
                                child: Text(
                                  'TAMAM',
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                onPressed: () {
                                  () => Navigator.of(context).pop();
                                },
                              ),
                            )),
                        SizedBox(width: 50),
                      ],
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
