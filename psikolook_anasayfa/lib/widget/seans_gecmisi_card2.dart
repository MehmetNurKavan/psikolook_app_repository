import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import '../view/psikologHome/psikologHomePageNesxts/on_seans_page.dart';

class SeansGecmisiCard extends StatefulWidget {
  final snap;
  const SeansGecmisiCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<SeansGecmisiCard> createState() => _SeansGecmisiCardState();
}

class _SeansGecmisiCardState extends State<SeansGecmisiCard> {
  String stkText = 'Görüllü Seans  ';
  String seans = '1 SEANS';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 10.0, top: 10.0, right: 3.0, left: 3.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: widget.snap['moneyValue'] == null ||
                          widget.snap['moneyValue'] == ''
                      ? InkWell(
                          child: const Text(
                              'seans sayısını belirlemek için dokun',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black54,
                                  fontSize: 11)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OnSeansPage(snap: widget.snap),
                                ));
                          },
                        )
                      : Text(seans,
                      textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 21)),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.snap['otherName'],
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(width: 10.0),
                      widget.snap['moneyValue'] == null ||
                              widget.snap['moneyValue'] == ''
                          ? Row(
                              children: [
                                Text(stkText,
                                    style: const TextStyle(
                                        color: pinkColor, fontSize: 17)),
                                Image.asset(
                                  'assets/images/hand_icon.png',
                                  width: 24.0,
                                )
                              ],
                            )
                          : Text('${widget.snap['moneyValue']}  TL',
                              style: const TextStyle(
                                  color: pinkColor, fontSize: 17)),
                    ],
                  ),
                ),
                Flexible(
                  child: widget.snap['otherPhotoUrl'] == null ||
                          widget.snap['otherPhotoUrl'] == ''
                      ? const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/default-usr.png'),
                          radius: 25,
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              NetworkImage(widget.snap['otherPhotoUrl']),
                          radius: 25,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.snap['addDate'],
                    style:
                        const TextStyle(color: blueColorAccent, fontSize: 14)),
                const SizedBox(width: 15.0),
                Text(widget.snap['dateDay'],
                    style:
                        const TextStyle(color: blueColorAccent, fontSize: 14)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
