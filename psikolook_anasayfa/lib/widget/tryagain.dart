import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class TryAgainPage extends StatefulWidget {
  const TryAgainPage({Key? key}) : super(key: key);

  @override
  State<TryAgainPage> createState() => _TryAgainPageState();
}

class _TryAgainPageState extends State<TryAgainPage> {
  bool isInternet = true;
  bool isVisible = true;
  internetController() {
    InternetAddress.lookup('google.com').then((result) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternet = true;
      } else {
        isInternet = false;
      }
    });
  }

  @override
  void initState() {
    internetController();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double wth = MediaQuery.of(context).size.width * 0.1;
    double hgh = MediaQuery.of(context).size.height * 0.25;
    String text =
        'Lütfen daha sonra internet bağlantınızı da kontrol ederek tekrar deneyiniz.';
    return Scaffold(
        body: isVisible
            ? Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/FirstPageBackGround.png"),
                        fit: BoxFit.cover)),
                child:
                    Center(child: Image.asset("assets/images/logo_kucuk.png")),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: backGroundColor),
                ),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0)),
                  ),
                  color: cardBackgroundColor,
                  margin: EdgeInsets.only(
                      bottom: hgh, top: hgh, left: wth, right: wth),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Image.asset('assets/images/uyari_siyah-icon.png'),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(text),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.black,
                                textStyle:
                                    const TextStyle(color: Colors.white)),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const Text('TAMAM')),
                      ])),
                ),
              ));
  }
}
