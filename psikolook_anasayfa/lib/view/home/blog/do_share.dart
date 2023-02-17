import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';

class DoShare extends StatefulWidget {
  const DoShare({super.key});

  @override
  State<DoShare> createState() => _DoShareState();
}

class _DoShareState extends State<DoShare> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 81.7,
              ),
              barField(),
              const SizedBox(
                height: 53,
              ),
              textField("Başlığını Buraya Yaz"),
              const SizedBox(
                height: 61,
              ),
              startWrite("Yazmaya başla..."),
              const SizedBox(
                height: 17,
              ),
              okElevatedButton(),
              const SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }

//close icon ve "blog yazısı yaz" kısmını içeriyor..
  Row barField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.2),
        const Text(
          "Blog Yazısı Yaz",
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
        closeIconButton(),
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
              child: const Text(
                "TAMAM",
                style: TextStyle(fontSize: 25),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22)))),
                  backgroundColor: MaterialStateProperty.all(Colors.black))),
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
          decoration: const InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.textFieldColor)),
              hintText: "Yazın kaç dakikada okunuyor?",
              suffixText: 'dkk ',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
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
                    icon: const Icon(
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
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.textFieldColor))),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 35,
      ),
    );
  }
}
