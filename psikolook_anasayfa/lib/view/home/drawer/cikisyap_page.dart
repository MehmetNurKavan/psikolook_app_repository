import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psikolook_anasayfa/view/home/drawer/destekAl_page.dart';

class CikisYapPage extends StatefulWidget {
  const CikisYapPage({super.key});

  @override
  State<CikisYapPage> createState() => _CikisYapPageState();
}

class _CikisYapPageState extends State<CikisYapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: buildCikisYap(context),
    );
  }

  Center buildCikisYap(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blurPage.png"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 13.0, sigmaY: 13.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 215, 226).withOpacity(0.5)),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topRight: Radius.circular(100)),
              ),
              color: Colors.white,
              margin:
                  EdgeInsets.only(bottom: 150, top: 150, left: 35, right: 35),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Container(
                      child: Text(
                        'Emin misin ?',
                        style: TextStyle(color: Colors.pink, fontSize: 23),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                            'Gidişin bizi üzüyor...Bir sorun olduysa uygulamaya dönüp bizden destek alabilirsin',
                            textAlign: TextAlign.center),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFFEE1AD)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          'EVET',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFFF0390)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DestekAlPage()));
                        },
                        child: Text(
                          'DESTEK AL',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFACF0F2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DestekAlPage()));
                        },
                        child: Text(
                          'HAYIR',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
