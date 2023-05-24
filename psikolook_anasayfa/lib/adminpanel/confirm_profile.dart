import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/adminpanel/admin_panel.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/profili_onayla_card.dart';

class ConfirmProfilePage extends StatefulWidget {
  const ConfirmProfilePage({Key? key}) : super(key: key);

  @override
  State<ConfirmProfilePage> createState() => _ConfirmProfilePageState();
}

class _ConfirmProfilePageState extends State<ConfirmProfilePage> {
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PsikologUserProvider userProvider =
        Provider.of<PsikologUserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor[0],
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdminPanel()));
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
                    .collection('PsikologUsers')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return ConfirmationCard(
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
