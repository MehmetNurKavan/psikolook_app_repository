import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class BilimeKatkiCard extends StatelessWidget {
  var snap;
  BilimeKatkiCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: Text('${snap['surveyTitle']}')),
                  const SizedBox(height: 15.0),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: snap['surveyLink'],
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      await Clipboard.setData(
                          ClipboardData(text: snap['surveyLink']));
                      showSnackBar(context, 'Kopyalanıldı');
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Kopyala',
                      style: TextStyle(color: blueColor),
                    )),
                TextButton(
                  child: const Text(
                    'Bağlantıya Git',
                    style: TextStyle(color: blueColor),
                  ),
                  onPressed: () async {
                    String url = snap['surveyLink'];
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Bağlantı açılamadı: $url';
                    }
                  },
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'iptal',
                      style: TextStyle(color: blueColor),
                    ))
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 0,
        color: cardBackgroundColor,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
              width: 0.75,
              color: colorFull[Random().nextInt(colorFull.length - 1)]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 7.5, right: 7.5, top: 30.0, bottom: 30.0),
          child: Center(
              child: Expanded(
                  child: Text(snap['surveyTitle'],
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 18)))),
        ),
      ),
    );
  }
}
