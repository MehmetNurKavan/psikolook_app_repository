import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/home_page/home_page.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import '../psikologHome/psikologKısmıIskeleti.dart';

class NewPasswordSuccesfullPage extends StatefulWidget {
  const NewPasswordSuccesfullPage({super.key});

  @override
  State<NewPasswordSuccesfullPage> createState() =>
      _NewPasswordSuccesfullPageState();
}

class _NewPasswordSuccesfullPageState extends State<NewPasswordSuccesfullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blurPage.png"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 215, 226).withOpacity(0.5)),
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Parolanızı yenileme Başarılı !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    ),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      child: Image.asset('assets/images/succesfull.png'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF0390),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, top: 15, bottom: 15),
                    child: Text("TAMAM"),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
      /* child: Row(
        children: [
          FloatingActionButton.small(
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'geri',
            child: Icon(Icons.arrow_back_ios_new, color: Colors.pink, size: 30),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ],
      ), */
    );
  }
}
