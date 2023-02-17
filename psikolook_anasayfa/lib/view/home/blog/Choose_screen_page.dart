import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/view/home/blog/Write_Blog_page%20.dart';
import 'package:psikolook_anasayfa/view/home/blog/Snap_page.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
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
              Color.fromARGB(255, 255, 236, 241),
              Color.fromARGB(255, 254, 243, 244),
              Color.fromARGB(255, 255, 248, 245),
              Color.fromARGB(255, 255, 252, 247),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backIconButton(),
            const SizedBox(height: 60),
            chooseElevatedButton("Blog Yazısı Yaz", const WriteBlog()),
            const SizedBox(
              height: 46,
            ),
            chooseElevatedButton("Paylaşım Yap", const SnapPage()),
          ],
        ),
      ),
    );
  }

//"Blog Yazısı Yaz" ve "Paylaşım Yap" buttonları....
  Center chooseElevatedButton(String elevatedButtonText, pageClassName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Container(
            height: 123,
            width: 304,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageClassName,
                        ));
                  },
                  child: Text(elevatedButtonText,
                      style: textStyle.chooseElevatedButtonStyle),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.customElevatedButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))))),
            )),
      ),
    );
  }

// IconButton önceki sayfaya döndüren...
  Padding backIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 72),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          )),
    );
  }
}
