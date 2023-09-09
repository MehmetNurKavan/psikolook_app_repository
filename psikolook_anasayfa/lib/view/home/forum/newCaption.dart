import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/bac_icon_button.dart';
import 'customs/forumcustoms.dart';

class newCaptionPage extends StatefulWidget {
  const newCaptionPage({Key? key}) : super(key: key);

  @override
  State<newCaptionPage> createState() => _newCaptionPageState();
}

class _newCaptionPageState extends State<newCaptionPage> {
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
                    Icon(
                      Icons.question_answer,
                      size: 34,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                  child: Center(
                    child: Text(
                      "Yeni Başlık",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 34,
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: ListTile(
                                textColor: Colors.red,
                                title: Text(
                                  "Ünvan İsim Soyisim\n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline),
                                ),
                                subtitle: Text(
                                  "Konu/DropDownMenu",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline),
                                ),
                                tileColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0,
                                  bottom: 8.0,
                                  right: 14.0,
                                  top: 14.0),
                              child: Expanded(
                                  child: TextField(
                                maxLength: 200,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText: "Yeni Başlık Oluştur",
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 36,
                        child: CircleAvatar(
                          radius: 32,
                          foregroundImage: AssetImage(
                            "assets/images/woman_blog.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Align(alignment: Alignment.topLeft, child: AddButton())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
