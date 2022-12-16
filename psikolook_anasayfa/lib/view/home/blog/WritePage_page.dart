import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 81.7,
            ),
            barField(),
            SizedBox(
              height: 53,
            ),
            textField("Başlığını Buraya Yaz"),
            SizedBox(
              height: 61,
            ),
            imageBox(),
            SizedBox(
              height: 44,
            ),
            startWrite("Yazmaya başla..."),
            SizedBox(
              height: 17,
            ),
            minuteWrite(),
            SizedBox(
              height: 29,
            ),
            okElevatedButton(),
            SizedBox(
              height: 45,
            )
          ],
        ),
      ),
    );
  }

//close icon ve "blog yazısı yaz" kısmını içeriyor..
  Row barField() {
    return Row(
      children: [
        closeIconButton(),
        Text(
          "Blog Yazısı Yaz",
          style: textStyle.witeblogTitleTextStyle,
        ),
      ],
    );
  }

  Row okElevatedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 44.0),
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "TAMAM",
                style: TextStyle(fontSize: 25),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22)))),
                  backgroundColor: MaterialStateProperty.all(
                      CustomColors.closeIconButtonColor))),
        ),
      ],
    );
  }

  Padding minuteWrite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: Container(
        width: 358,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(17)),
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.textFieldColor)),
              hintText: "Yazın kaç dakikada okunuyor?",
              suffixText: 'dkk ',
              hintStyle: textStyle.minuteTextStyle),
        ),
      ),
    );
  }

  Padding startWrite(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: Expanded(
        child: Container(
          width: 358,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: textStyle.startWriteBlogHintStyle),
              maxLines: null,
              minLines: 15,
            ),
          ),
        ),
      ),
    );
  }

  Padding imageBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        //height: 358,
        //width: 304,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_rounded,
                      size: 29,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textField(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: textStyle.textFieldHintStyle,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.textFieldColor))),
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
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.closeIconButtonColor),
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
