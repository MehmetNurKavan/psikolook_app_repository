import 'package:flutter/material.dart';

import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    'Parolanızı yenileme Başarılı !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/succesfull.png'),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const homePage()));
                        },
                        child: const Text("TAMAM"),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
