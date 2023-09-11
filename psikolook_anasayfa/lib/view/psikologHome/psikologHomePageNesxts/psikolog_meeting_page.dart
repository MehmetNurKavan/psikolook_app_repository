import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class PsikologMeetingPage extends StatefulWidget {
  final snap;
  const PsikologMeetingPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<PsikologMeetingPage> createState() => _PsikologMeetingPageState();
}

class _PsikologMeetingPageState extends State<PsikologMeetingPage> {
  TextEditingController meetController = TextEditingController();
  updateDate(String dateId, String meetLink) async {
    try {
      if (meetLink == null || meetLink == '') {
        Navigator.pop(context);
      } else {
        await FireStoreMethods().updateDate3(dateId, meetLink);
        showSnackBar(context, 'Link Eklenildi');
        Navigator.pop(context);
      }
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  updateDate2(String dateId, String meetLink) async {
    try {
      await FireStoreMethods().updateDate3(dateId, meetLink);
      showSnackBar(context, 'Link Silindi');
      Navigator.pop(context);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

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
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Column(
                children: [
                  const Text(
                    'Buraya Görüşme Linkini Yapıştır',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  widget.snap['meetLink'] == null ||
                          widget.snap['meetLink'] == ''
                      ? Container()
                      :Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Linki Kaldır',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Icon(Icons.close, color: Colors.black),
                                  ],
                                ),
                                onPressed: () {
                                  updateDate2(widget.snap['dateId'], '');
                                },
                              ),
                            )
                          ],
                        ),
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            widget.snap['meetLink'] == null ||
                                    widget.snap['meetLink'] == ''
                                ? TextField(
                                    controller: meetController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    cursorColor: Colors.black,
                                  )
                                : TextField(
                                    decoration: InputDecoration(
                                      hintText:
                                          widget.snap['meetLink'].toString(),
                                    ),
                                    controller: meetController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
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
                          updateDate(widget.snap['dateId'],
                              meetController.text.toString());
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
