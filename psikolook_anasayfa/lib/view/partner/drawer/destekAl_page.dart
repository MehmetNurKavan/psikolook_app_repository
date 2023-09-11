import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class DestekAlPage extends StatefulWidget {
  const DestekAlPage({Key? key}) : super(key: key);

  @override
  State<DestekAlPage> createState() => _DestekAlPage();
}

class _DestekAlPage extends State<DestekAlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 215, 226),
      body: buildCikisYap(context),
    );
  }

  final Email email = Email(
    subject: 'Psikolook App Kullanıcı Destek Ol',
    recipients: ['ppsikolook@gmail.com'],
/*   cc: ['cc@example.com'],
  bcc: ['bcc@example.com'],
  attachmentPaths: ['/path/to/attachment.zip'], */
    isHTML: true,
  );

  Container buildCikisYap(BuildContext context) {
    double wth = MediaQuery.of(context).size.width * 0.1;
    double hgh = MediaQuery.of(context).size.height * 0.25;
    return Container(
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
        color: Colors.white,
        margin: EdgeInsets.only(bottom: hgh, top: hgh, left: wth, right: wth),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              const Text(
                'Destek Al',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'Bir sorun mu var?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ),
              InkWell(
                  child: const Text(
                    'ppsikolook@gmail.com',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        color: Colors.pink),
                  ), //psikolok gelecek de bakalim
                  onTap: () => FlutterEmailSender.send(email)),
              const Text(
                'Mail atarak bizimle\niletişime geç',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'TAMAM',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
