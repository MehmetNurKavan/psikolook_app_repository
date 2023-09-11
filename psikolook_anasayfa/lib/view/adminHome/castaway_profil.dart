import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/adminHome/admin_panel.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/castaway_card.dart';

class CastewayProfilePage extends StatefulWidget {
  const CastewayProfilePage({Key? key}) : super(key: key);

  @override
  State<CastewayProfilePage> createState() => _CastewayProfilePageState();
}

class _CastewayProfilePageState extends State<CastewayProfilePage> {
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor[0],
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const AdminPanel()),(route) => false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profili Onayla",
          style: TextStyle(fontSize: 21, color: Colors.black54),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('OtherUsers')
                    .where('castawayUrl', isNotEqualTo: '')
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
                      return CastawayCard(
                          snap: snapshot.data!.docs[index].data());
                    },
                  );
                },
              ),
              isLoading ? const LinearProgressIndicator() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
