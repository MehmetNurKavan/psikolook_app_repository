import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/bac_icon_button.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
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
                    padding:
                        const EdgeInsets.only(top: 90, right: 24, left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackIconButton2(),
                        SizedBox(
                          width: width * 0.6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 30),
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.search_circle_fill,
                                size: 50,
                              ),
                            ],
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
                child: Text(
                  "KONULAR",
                  style: GoogleFonts.montserrat(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              buildPsikolookFormQuestionSection(height, width, context),
              buildPsikolookFormQuestionSection(height, width, context),
              buildPsikolookFormQuestionSection(height, width, context),
            ],
          ),
        ),
      ),
    );
  }

  buildSectionName(String sectionName, var width, context, var routee) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.01,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routee));
          },
          child: Text(
            sectionName,
            style: GoogleFonts.montserrat(
                color: Colors.black,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  buildPsikolookFormQuestionSection(
    var height,
    var width,
    context,
  ) {
    return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15, right: 15),
            child: Center(
              child: Expanded(
                child: Text(
                  "Konu Başlığı",
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ));
  }
}
