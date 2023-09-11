import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/otherHome/psikolook/profil_read.dart';

class PsikologCard extends StatefulWidget {
  final snap;
  const PsikologCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PsikologCard> createState() => _PsikologCardState();
}

class _PsikologCardState extends State<PsikologCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: purpleColor[1],
        child: Card(
          color: cardBackgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(widget.snap['username'])),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widget.snap['photoUrl'] == null ||
                            widget.snap['photoUrl'] == ''
                        ? const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/default-usr.png'),
                            radius: 40,
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(widget.snap['photoUrl']),
                          ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      child: 
                      widget.snap['interestField'].toString() == '' || widget.snap['interestField'] == null || widget.snap['interestField'].toString() == 'null' ?
                      const Text('Lütfen düzenleye tıklayıp ilgilendiğiniz alanı yazınız!')
                      :
                          ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.snap['interestField'].length,
                          primary: false,
                          itemBuilder: (context, index) {
                            return Card(
                              color: colorsInterstField[ index==colorsInterstField.length ? index - colorsInterstField.length : index],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 15.0,right: 15.0),
                                child: Text(widget.snap['interestField'][index]),
                              ));
                          },
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.video_camera_back,
                            color: Colors.black),
                        const SizedBox(width: 5.0),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              widget.snap['moneyValue']=='' ||widget.snap['moneyValue']==null
                              || widget.snap['seansDkkValue']==''||widget.snap['seansDkkValue']==null
                              ?'Seans bilgisi belirtilmemiş':
                              '${widget.snap['seansDkkValue']} dkk online terapi ${widget.snap['moneyValue']} TL',
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: const StadiumBorder(),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black87,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Profili İncele'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfilRead(uid: widget.snap['uid'])));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
