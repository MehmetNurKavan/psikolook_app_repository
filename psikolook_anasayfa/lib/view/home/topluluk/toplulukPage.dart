import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/adminpanel/add_new_group.dart';
import 'package:psikolook_anasayfa/widget/group_card.dart';

class ToplulukPage extends StatefulWidget {
  const ToplulukPage({Key? key}) : super(key: key);

  @override
  State<ToplulukPage> createState() => _ToplulukPageState();
}

class _ToplulukPageState extends State<ToplulukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Ara',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text('Topluluk', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SizedBox(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Topluluk').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                return GroupCard(
                  snap: snapshot.data!.docs[index].data(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
