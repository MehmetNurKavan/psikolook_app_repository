import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class OnSeansPage extends StatefulWidget {
  final snap;
  const OnSeansPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<OnSeansPage> createState() => _OnSeansPageState();
}

class _OnSeansPageState extends State<OnSeansPage> {
  String titleText = 'ÖN SEANSLA BELRLEDİĞİNİZ TOPLAM SEANS SAYISINI GİRİNİZ';
  TextEditingController seyansSayisiController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 30, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Flexible(
                              child: Text('1 SEANS',
                                  style: TextStyle(fontSize: 25)),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.snap['otherName'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                  const SizedBox(height: 10),
                                  widget.snap['moneyValue'] == null ||
                                          widget.snap['moneyValue'] == ''
                                      ? Row(
                                          children: [
                                            const Text('Gönüllü Seans',
                                                style: TextStyle(
                                                    color: pinkColor,
                                                    fontSize: 17)),
                                            Image.asset(
                                              'assets/images/hand_icon.png',
                                              width: 24.0,
                                            )
                                          ],
                                        )
                                      : Text(
                                          '${widget.snap['moneyValue']}TL',
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                tileMode: TileMode.decal,
                                colors: pinkColors
                              ),
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(widget.snap['otherName'],
                                    style: const TextStyle(fontSize: 22)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    'Belirlenen Toplam Seans Sayısı',
                                    style: TextStyle(color: pinkColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: seyansSayisiController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 10,
                                        top: 10),
                                    child: Text(
                                      'TAMAM',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
