import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/bac_icon_button.dart';

class newAnswerPage extends StatefulWidget {
  @override
  State<newAnswerPage> createState() => _newAnswerPageState();
}

class _newAnswerPageState extends State<newAnswerPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroun1.png"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, right: 24, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackIconButton2(),
                    Icon(
                      CupertinoIcons.question_circle_fill,
                      size: 50,
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Yeni Soru",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 34,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      height: height * 0.35,
                      child: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          textColor: Colors.red,
                          title: const Text(
                            "Ünvan İsim Soyisim",
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline),
                          ),
                          enabled: false,
                          subtitle: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const TextField(
                                  decoration: InputDecoration(
                                      label: Text("Konu:DropdownMenu gelecek")),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextField(
                                  maxLength: 500,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Sorunuzu Yazınız",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          tileColor: Colors.white,
                          trailing: Container(
                            width: width * 0.08,
                            alignment: const Alignment(1, -5),
                            child: const SizedBox(
                              child: CircleAvatar(
                                foregroundImage: AssetImage(
                                  "assets/images/woman_blog.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.only(
                          right: 24,
                          left: 24,
                        ),
                        backgroundColor: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      "EKLE",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
