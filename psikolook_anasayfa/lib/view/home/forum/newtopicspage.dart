import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/bac_icon_button.dart';
import 'customs/forumcustoms.dart';

class newTopicPage extends StatefulWidget {
  @override
  State<newTopicPage> createState() => _newTopicPageState();
}

class _newTopicPageState extends State<newTopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroun1.png"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: PaddingCustom(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackIconButton2(),
                    Image(
                      width: 50,
                      color: Colors.black,
                      image: AssetImage(
                        "assets/images/forum_icon.png",
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25.0),
                Center(
                  child: Text(
                    "Yeni Konu",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 34,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 15.0, bottom: 8.0),
                        child: TextFormField(
                          maxLength: 50,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Yeni Konu Oluştur",
                            hintStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Center(
                    child: AddButton(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
