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
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backIconButton(),
          SizedBox(height: 60),
          chooseElevatedButton("Blog Yazısı Yaz", WriteBlog()),
          SizedBox(
            height: 46,
          ),
          chooseElevatedButton("Paylaşım Yap", SnapPage()),
        ],
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
      padding: EdgeInsets.only(left: 34, top: 72),
      child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19), color: Colors.white),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: CustomColors.backIconColor,
                )),
          )),
    );
  }
}
