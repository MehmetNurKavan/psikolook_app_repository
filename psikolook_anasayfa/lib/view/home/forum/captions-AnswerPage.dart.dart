import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/bac_icon_button.dart';

class CaptionAnswerPage extends StatefulWidget {
  const CaptionAnswerPage({Key? key}) : super(key: key);

  @override
  State<CaptionAnswerPage> createState() => _CaptionAnswerPageState();
}

class _CaptionAnswerPageState extends State<CaptionAnswerPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/backgroun1.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 90, right: 24, left: 24, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackIconButton2(),
                        SizedBox(
                          width: width * 0.6,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 30),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                  ),
                  width: width * 0.85,
                  height: height * 0.07,
                  child: Center(
                    child: Text(
                      "Konu",
                      style: GoogleFonts.montserrat(
                          decoration: TextDecoration.underline,
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: height * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: const Alignment(-1, 1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Ünvan",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 21,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "Başlık",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                width: width * 0.4,
                                alignment: const Alignment(4, -14),
                                child: const SizedBox(
                                  child: CircleAvatar(
                                    foregroundImage: AssetImage(
                                      "assets/images/woman_blog.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      CupertinoIcons.captions_bubble),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.repeat),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 15, bottom: 25),
                    child: Row(
                      children: [
                        Text(
                          "Cevaplar",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  buildAnswerSection(height, width),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  buildAnswerSection(height, width),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  buildAnswerSection(height, width),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAnswerSection(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Container(
              alignment: const Alignment(0.9, -2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ünvan",
                      style: GoogleFonts.montserrat(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cevap",
                        style: GoogleFonts.montserrat(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: const Alignment(1, -3),
                  height: height * 0.20,
                  width: width * 1,
                  child: const ListTile(
                    leading: CircleAvatar(
                      foregroundImage: AssetImage(
                        "assets/images/woman_blog.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.captions_bubble),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.repeat),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
