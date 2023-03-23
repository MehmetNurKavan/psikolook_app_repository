import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DestekAlPage extends StatefulWidget {
  const DestekAlPage({Key? key}) : super(key: key);

  @override
  State<DestekAlPage> createState() => _DestekAlPage();
}

class _DestekAlPage extends State<DestekAlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: buildCikisYap(context),
    );
  }

  Container buildCikisYap(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
          colors: backGroundColor
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100), topRight: Radius.circular(100)),
        ),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 150, top: 150, left: 25, right: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Container(
                child: Text(
                  'Destek Al',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Bir sorun mu var?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ),
                ),
              ),
              InkWell(
                  child: new Text(
                    'ppsikolook@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ), //psikolok gelecek de bakalim
                  onTap: () => launch('https://mail.google.com')),
              Container(
                width: 200,
                child: Text(
                  'Mail atarak bizimle iletişime geç',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
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
