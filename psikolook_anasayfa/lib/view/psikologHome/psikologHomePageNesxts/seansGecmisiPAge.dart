import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/seans_gecmisi_card2.dart';
import 'package:intl/intl.dart';

class SeansGecmisiPAge extends StatefulWidget {
  const SeansGecmisiPAge({Key? key}) : super(key: key);

  @override
  State<SeansGecmisiPAge> createState() => _SeansGecmisiPAgeState();
}

class _SeansGecmisiPAgeState extends State<SeansGecmisiPAge> {
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
              colors: backGroundColor),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'SEANS GEÇMİŞİNİZ',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('dateAvailable')
                        .where('uid',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .where('isVisible', isEqualTo: false)
                        .where('datePublished',
                            isLessThanOrEqualTo: DateTime.now())
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: circleLoading(),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => SeansGecmisiCard(
                              snap: snapshot.data!.docs[index].data()),
                        );
                      } else {
                        return const Center(
                            child: Text(
                                'Görünüşe göre henüz seans gerçekleştirmediniz.'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
