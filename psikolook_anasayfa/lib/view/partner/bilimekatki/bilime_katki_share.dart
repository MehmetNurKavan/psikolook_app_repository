import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/anket_ekle_page.dart';
import 'package:psikolook_anasayfa/widget/back_button.dart';
import 'package:psikolook_anasayfa/widget/bilime_katki_card.dart';

class BilimeKatkiShare extends StatefulWidget {
  const BilimeKatkiShare({Key? key}) : super(key: key);

  @override
  State<BilimeKatkiShare> createState() => _BilimeKatkiShareState();
}

class _BilimeKatkiShareState extends State<BilimeKatkiShare> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackIconButton(),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Text('Ödeme Yapın',
                            style: TextStyle(color: pinkColor, fontSize: 12)),
                        const SizedBox(width: 5.0),
                        Image.asset('assets/images/card_icon.png',
                            color: pinkColor, width: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text('Anket Ekle',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(width: 0.4, color: greyColor),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BilimeKatkiPage()));
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Image.asset(
                          'assets/images/lab_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AnketEklePage()));
                },
                child: Card(
                  elevation: 0,
                  color: cardBackgroundColor,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(width: 0.4, color: greyColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 20.0, bottom: 20.0),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text('Anket Ekle',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18)),
                          ),
                        ),
                        Icon(Icons.more_horiz, size: 30, color: Colors.black54),
                        SizedBox(width: 15.0),
                      ],
                    )),
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Survey')
                    .where('uid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: circleLoading(),
                    );
                  }
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return BilimeKatkiCard(
                        snap: snapshot.data!.docs[index].data(),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
