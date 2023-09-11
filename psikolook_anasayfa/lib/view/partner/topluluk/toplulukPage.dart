import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/topluluk_contract.dart';
import 'package:psikolook_anasayfa/widget/group_card.dart';

class ToplulukPage extends StatefulWidget {
  const ToplulukPage({Key? key}) : super(key: key);

  @override
  State<ToplulukPage> createState() => _ToplulukPageState();
}

class _ToplulukPageState extends State<ToplulukPage> {
  var userData1 = {};
  var userData2 = {};
  bool toplulukContrat = false;
  bool _isLoading = false;
  final _nicknameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData2();
    getData1();
  }

  getData2() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('OtherUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData2 = userSnap.data()!;
      setState(() {});
    } catch (e) {}
    setState(() {
      _isLoading = false;
    });
  }

  getData1() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData1 = userSnap.data()!;
      setState(() {});
    } catch (e) {}
    setState(() {
      _isLoading = false;
    });
  }

  boolNickName() {
    if (userData1['email'] == null) {
      return userData2['nickname'];
    } else {
      return userData1['nickname'];
    }
  }

  void updateNickName2() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });
    if (toplulukContrat == true) {
      String res = await OtherAuthMethods().updateNickNameOtherUser(
        nickname: _nicknameController.text.trim(),
      );
      if (res == "Kayıt Başarılı") {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ToplulukPage()));
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      showSnackBar(context,
          'Lütfen Topluluk Kurallarını Onayladıkltan sonra İlerleyiniz!');
    }
  }

  boolProfil() {
    if (userData1['email'] == null) {
      return updateNickName2();
    } else {
      return updateNickName1();
    }
  }

  void updateNickName1() async {
    setState(() {
      _isLoading = true;
    });
    if (toplulukContrat == true) {
      String res = await AuthMethods().updateNickNamePsikologUser(
        nickname: _nicknameController.text.trim(),
      );
      if (res == "Kayıt Başarılı") {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ToplulukPage()),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      showSnackBar(context,
          'Lütfen Topluluk Kurallarını Onayladıkltan sonra İlerleyiniz!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
/*         leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)), */
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
        toolbarHeight: 75,
      ),
      body: _isLoading
          ? const LinearProgressIndicator()
          : boolNickName().toString() == "" ||
                  boolNickName().toString() == 'null'
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Görünüşe göre henüz bir takma ada sahip değilsiniz, takma adınızı girip toplulukta toplumsal kuralları çerçevesinde sohbet edebilirsiniz.',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        margin: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _nicknameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'takma ad giriniz',
                              filled: true,
                              fillColor: Colors.white70),
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 100.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () async {
                                bool data = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ToplulukContrat()));
                                toplulukContrat = data;
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "Topluluk Kuralları",
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Text("nı okudum kabul ediyorum",
                                      style: TextStyle(color: Colors.black)),
                                ],
                              )),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Card(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                checkColor: Colors.pink,
                                activeColor: Colors.pink,
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                value: toplulukContrat,
                                onChanged: (bool? value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: boolProfil,
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 13, bottom: 13),
                            child: Text("İLERLE")),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  child: StreamBuilder(
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
                          return GroupCard(
                            nickname: boolNickName().toString(),
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
