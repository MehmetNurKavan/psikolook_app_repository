import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psikolook_anasayfa/view/partner/login/tenthPage.dart';
import 'package:psikolook_anasayfa/widget/atla_button.dart';

class NinthPage extends StatefulWidget {
  const NinthPage({Key? key}) : super(key: key);

  @override
  State<NinthPage> createState() => _NinthPageState();
}

class _NinthPageState extends State<NinthPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/two.png",
            ),
            fit: BoxFit.fill,
          ),
        ), */
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Page9.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Expanded(
                        child: Text(
                          "Psikologlar tarafından yazılmış\npsikoeğitim / blog yazıları",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 20, child: Image.asset("assets/images/logo_kucuk.png")),
          ],
        ),
      ),
    );
  }
}

Widget customSizedBox() => const SizedBox(height: 30);
