import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/back_button.dart';
import 'package:psikolook_anasayfa/widget/bilime_katki_card.dart';

class BilimeKatkiPage extends StatefulWidget {
  const BilimeKatkiPage({Key? key}) : super(key: key);

  @override
  State<BilimeKatkiPage> createState() => _BilimeKatkiPageState();
}

class _BilimeKatkiPageState extends State<BilimeKatkiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BackIconButton(),
                  const Text('Bilime Katkı', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10.0),
                ],
              ),
              const SizedBox(height: 15.0),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Survey').snapshots(),
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
