import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/admin_grop_card.dart';

class AddNewGroup extends StatefulWidget {
  const AddNewGroup({Key? key}) : super(key: key);

  @override
  State<AddNewGroup> createState() => _AddNewGroupState();
}

class _AddNewGroupState extends State<AddNewGroup> {
  bool isLoading = false;
  final TextEditingController _groupTitleController = TextEditingController();
  void addGroup(
    String uid,
    String groupTitle,
  ) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      if (_groupTitleController != null && _groupTitleController.text != "") {
        // upload to storage and db
        String res = await FireStoreMethods().uploadNewTopluluk(
          uid,
          _groupTitleController.text,
        );
        if (res == "success") {
          setState(() {
            isLoading = false;
            _groupTitleController.text = '';
          });
          showSnackBar(
            context,
            'Yeni Topluluk Oluşturuldu!',
          );
        } else {
          showSnackBar(context, res);
        }
      } else {
        showSnackBar(context, 'Henüz bir değer girmediniz!');
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _groupTitleController.dispose();
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
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Topluluk için Kategori Ekle",
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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  maxLength: 50,
                  controller: _groupTitleController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Image.asset('assets/images/confirm_icon.png'),
                        onPressed: () => 
                        addGroup(
                          FirebaseAuth.instance.currentUser!.uid,
                          _groupTitleController.text.trim(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      hintText: 'BURAYA BİR BAŞLIK GİR',
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  maxLines: null,
                  minLines: 1,
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Topluluk')
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
                      return AdminGroupCard(
                        snap: snapshot.data!.docs[index].data(),
                      );
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
