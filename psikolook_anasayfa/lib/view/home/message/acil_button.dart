import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customTextStyle.dart';

class AcilDurumPage extends StatefulWidget {
  const AcilDurumPage({Key? key}) : super(key: key);

  @override
  State<AcilDurumPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<AcilDurumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset('assets/images/uyari_siyah-icon.png'),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            'ACİL DURUM UYARISI GÖNDERMEK İSTEDİĞİNE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                        const Text('Emin misin?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 3, 146),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50.0),
                                        topRight: Radius.circular(50.0),
                                        topLeft: Radius.circular(50.0),
                                        bottomRight: Radius.circular(50.0),
                                      ),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: Color.fromARGB(
                                              255, 201, 201, 201))),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 75, right: 75, top: 12, bottom: 12),
                                  child: Text(
                                    'EVET',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          //color: Colors.white,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            )),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 75, right: 75, top: 12, bottom: 12),
                            child: Text(
                              'HAYIR',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView(
                  primary: false,
                  children: [
                    const Text(
                        'Acil durum butonu yalnızca acil durumlarda (intihar düşünceleri, doğal afet sonrası tramva vs.) kullanılmalıdır!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13)),
                    const SizedBox(height: 10),
                    const Text(
                        'Psikologun e hızlı şekilde mesajına dönemsini sağlar.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
