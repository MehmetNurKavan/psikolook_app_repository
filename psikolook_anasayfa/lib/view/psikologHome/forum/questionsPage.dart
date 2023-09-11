import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/bac_icon_button.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

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
                  "SORULAR",
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: height * 0.25,
            child: Card(
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                textColor: Colors.red,
                title: const Text(
                  "\nÜnvan İsim Soyisim\n \nLisans Bilgisi",
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                enabled: false,
                subtitle: InkWell(
                  onTap: () {
                    //Buraya Konunn adresi gelecek
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "\nSoru",
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.underline),
                  ),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  width: width * 0.4,
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
    );
  }
}
