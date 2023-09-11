import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/seans_gecmisi_card.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  String dateDay = DateFormat('dd.MM.yyyy').format(DateTime.now());
  bool isNotVisibleButton = false;
  bool isVisibleButton = true;
  String tarih = 'Tarih:';

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
            padding: const EdgeInsets.only(left: 10.0, top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    FloatingActionButton.small(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'geri',
                      elevation: 0,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                  ],
                ),
/*                 Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tarih: ',
                          style: TextStyle(
                            fontSize: 21,
                            color: Color(0xFF5CE1E6)
                          ),
                        ),
                        Text(
                          dateDay,
                          style: const TextStyle(
                            fontSize: 21,
                            color: Color(0xFF5CE1E6)
                          ),
                        ),
                      ],
                    ),
                  ),
                ), */
                const SizedBox(height: 15.0),
                Card(
                  elevation: 0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'PLANLANILMIŞ SEANSLARIN',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('dateAvailable')
                        .where('uid',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .where('isVisible', isEqualTo: false)
                        .where('datePublished',
                            isGreaterThanOrEqualTo:
                                DateTime.now())
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
                          itemBuilder: (context, index) =>
                              PlanlanilmisSeansCard(
                                  snap: snapshot.data!.docs[index].data()),
                        );
                      } else {
                        return const Center(
                            child: Text(
                                'Görünüşe göre planlanılmış bir seans gözükmüyor.'));
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
