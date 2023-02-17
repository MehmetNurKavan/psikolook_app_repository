import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/view/home/blog/WritePage_page.dart';

class WriteBlog extends StatefulWidget {
  const WriteBlog({super.key});

  @override
  State<WriteBlog> createState() => _WriteBlogState();
}

class _WriteBlogState extends State<WriteBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 81.7),
          Column(
            children: [
              barField(),
              SizedBox(height: 75),
              hearthIcon(),
              SizedBox(height: 23.5),
              startWriteElevatedButton("Yazmaya Başla"),
            ],
          ),
        ],
      ),
    );
  }

//close icon'u ve text kısmını içeriyor...
  Row barField() {
    return Row(
      children: [
        closeIconButton(),
        const Text("Blog Yazısı Yaz",
            style: TextStyle(color: Colors.white, fontSize: 27))
      ],
    );
  }

  Center startWriteElevatedButton(String elevatedbuttonText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29.0),
        child: Container(
            height: 70,
            width: 356,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WritePage()));
                  },
                  icon: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 29),
                    child: Icon(
                      Icons.more_horiz,
                      color: Color(0x73000000),
                      size: 35,
                    ),
                  ),
                  label: Text(elevatedbuttonText,
                      style: textStyle.startWriteTextStyle),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.customElevatedButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))),
            )),
      ),
    );
  }

  Container hearthIcon() {
    return Container(
      height: 71,
      width: 71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5), color: Colors.white),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/heart.png'),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: Colors.white,
            iconSize: 22,
          )),
    );
  }
}
