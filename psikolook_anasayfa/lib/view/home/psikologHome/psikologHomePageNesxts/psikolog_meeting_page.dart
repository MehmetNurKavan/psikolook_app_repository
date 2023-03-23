import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class PsikologMeetingPage extends StatefulWidget {
  const PsikologMeetingPage({Key? key}) : super(key: key);

  @override
  State<PsikologMeetingPage> createState() => _PsikologMeetingPageState();
}

class _PsikologMeetingPageState extends State<PsikologMeetingPage> {

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 30),
                      elevation: 0,
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  const Text(
                    'Buraya Zoom Linkini Yapıştır',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        side: BorderSide(
                            width: 1.5,
                            color: Color.fromARGB(255, 201, 201, 201))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onChanged: (String deger) {
                                if (deger.length > 3) {
                                  print(deger);
                                }
                              },
                              onSubmitted: (String deger) {
                                print("submit " + deger);
                              },
                              cursorColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        //color: Colors.white,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0),
                              ),
                              side: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 201, 201, 201))),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 12),
                          child: Text(
                            'TAMAM',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        onPressed: () {
                          () => Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
