import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import '../view/psikologHome/psikologHomePageNesxts/psikolog_meeting_page.dart';

class PlanlanilmisSeansCard extends StatefulWidget {
  final snap;
  const PlanlanilmisSeansCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PlanlanilmisSeansCard> createState() => _PlanlanilmisSeansCardState();
}

class _PlanlanilmisSeansCardState extends State<PlanlanilmisSeansCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(widget.snap['addDate'],
                    style:
                        const TextStyle(color: blueColorAccent, fontSize: 25)),
                const SizedBox(height: 15.0),
                Text(widget.snap['dateDay'],
                    style:
                        const TextStyle(color: blueColorAccent, fontSize: 14)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        widget.snap['otherName'] ?? 'İsim Tanımlanılmadı',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    widget.snap['photoUrl'] == null ||
                            widget.snap['photoUrl'] == ''
                        ? const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/default-usr.png'),
                            radius: 30,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(widget.snap['photoUrl']),
                            radius: 30,
                          ),
                  ],
                ),
                const SizedBox(height: 15),
                widget.snap['meetLink'] == null || widget.snap['meetLink'] == ''
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 217, 167, 179),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.0))),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Görüşme Linki Ekle',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PsikologMeetingPage(snap: widget.snap)));
                        },
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.0))),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Link Eklenildi',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PsikologMeetingPage(snap: widget.snap)));
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
