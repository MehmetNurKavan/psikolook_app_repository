import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/otherHome/home_page/meeting_page.dart';

class NextMeetCardOther extends StatefulWidget {
  final snap;
  const NextMeetCardOther({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<NextMeetCardOther> createState() => _NextMeetCardOtherState();
}

class _NextMeetCardOtherState extends State<NextMeetCardOther> {
  String halfInfinityPng = 'assets/images/infinity_half_big.png';
  String defaultUserPng = 'assets/images/default-usr.png';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(width: 0.4, color: greyColor),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              halfInfinityPng,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: pinkColors),
                ),
                child: Center(
                  child: Text(
                    widget.snap['username'],
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.snap['photoUrl'] == null ||
                          widget.snap['photoUrl'] == ''
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(defaultUserPng),
                          radius: 34,
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              NetworkImage(widget.snap['photoUrl']),
                          radius: 34,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2.5),
                      Text(
                        'Tarih: ${widget.snap['dateDay']}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 2.5),
                      Text(
                        'Saat: ${widget.snap['addDate']}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: blueButtonColors),
                        ),
                        width: 175,
                        child: TextButton(
                          child: const Text('Görüşme Linki',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MeetingPage(snape: widget.snap)));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
