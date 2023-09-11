import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/palnlanPage.dart';

class NextMeetCard extends StatefulWidget {
  final snap;
  const NextMeetCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<NextMeetCard> createState() => _NextMeetCardState();
}

class _NextMeetCardState extends State<NextMeetCard> {
  String halfInfinityPng = 'assets/images/infinity_half_big.png';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
            width: 0.4, color: greyColor),
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
                    colors: pinkColors
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.snap['otherName'],
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.snap['otherPhotoUrl'] == null ||
                        widget.snap['otherPhotoUrl'] == ''
                    ? const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/default-usr.png'),
                        radius: 34,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            NetworkImage(widget.snap['otherPhotoUrl']),
                        radius: 34,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PlanPage()));
                        },
                        child: const Text(
                          'En yakın seanslarınızı görünüz',
                          style: TextStyle(
                          decoration: TextDecoration.underline,  
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        )),
                    Text(
                      'Tarih: ${widget.snap['dateDay']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height:2.5),
                    Text(
                      'Saat: ${widget.snap['addDate']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
