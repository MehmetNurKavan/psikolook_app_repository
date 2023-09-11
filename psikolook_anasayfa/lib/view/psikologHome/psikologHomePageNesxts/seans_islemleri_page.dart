import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/payment/payment_page.dart';

class SeansIslemleriPage extends StatefulWidget {
  const SeansIslemleriPage({Key? key}) : super(key: key);

  @override
  State<SeansIslemleriPage> createState() => _SeansIslemleriPageState();
}

class _SeansIslemleriPageState extends State<SeansIslemleriPage> {
  TextEditingController moneyController = TextEditingController();
  TextEditingController seansDkkController = TextEditingController();
  bool isLoading = false;
  var userData = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    moneyController;
    seansDkkController;
    super.dispose();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  updateDate(String uid, String moneyValue, String seansDkkValue) async {
    try {
      String res =
          await FireStoreMethods().updateDate4(uid, moneyValue, seansDkkValue);
      if (res == 'success') showSnackBar(context, 'Kayıt Başarılı');
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: isLoading
            ? Center(child: circleLoading())
            : SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          FloatingActionButton.small(
                            onPressed: () => Navigator.of(context).pop(),
                            tooltip: 'geri',
                            elevation: 0,
                            backgroundColor: Colors.black,
                            child:
                                const Icon(Icons.arrow_back_ios_new, size: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'BURAYI SADECE ÜCRETLİ OLARAK ÇALIŞANLAR KULLANACAKTIR, ÖĞRENCİLERE HERHANGİ BİR ÜCRET ÖDEMESİ YAPILMAYACAKTIR',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Column(
                        children: [
                          const Text(
                            'PSİKOLOOK HESABI',
                            style: TextStyle(color: pinkColor, fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          buildParayiAktarinCard(context),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(width: 30, height: 30),
                              Text(
                                'SEANS ÜCRETİNİZ',
                                style:
                                    TextStyle(color: pinkColor, fontSize: 16),
                              ),
                            ],
                          ),
                          buildSeansUcretiCard(),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(width: 30, height: 30),
                              Text(
                                'SEANS DAKİKANIZ',
                                style:
                                    TextStyle(color: pinkColor, fontSize: 16),
                              ),
                            ],
                          ),
                          buildSeansDkkCard(),
                          const SizedBox(height: 15.0),
                          const Text(
                            'Psikolook Psikolog tanıtım bedeli olarak aldığınız ücretten %20 komisyon keser.',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.black,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  circleLoading();
                                  updateDate(
                                      userData['uid'],
                                      moneyController.text.toString(),
                                      seansDkkController.text.toString());
                                },
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Text('TAMAM'),
                                ),
                              ),
                            ],
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

  Widget buildParayiAktarinCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.decal,
                  colors: pinkColors),
            ),
            child: TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage(navigator: Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SeansIslemleriPage(),)),))),
              child: const Text(
                'Banka Hesap Bilgilerini Düzenle',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card buildSeansUcretiCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '1 SEANS',
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: pinkColors),
                ),
                child: TextField(
                  controller: moneyController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixText: 'TL',
                    suffixIconColor: Colors.black,
                    hintText: userData['moneyValue'] == null ||
                            userData['moneyValue'] == ''
                        ? 'ücret giriniz'
                        : userData['moneyValue'],
                    hintStyle: const TextStyle(color: Colors.black87),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildSeansDkkCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '1 SEANS',
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: pinkColors),
                ),
                child: TextField(
                  controller: seansDkkController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixText: 'dkk',
                    suffixIconColor: Colors.black,
                    hintText: userData['seansDkkValue'] == null ||
                            userData['seansDkkValue'] == ''
                        ? 'dkk giriniz'
                        : userData['seansDkkValue'],
                    hintStyle: const TextStyle(color: Colors.black87),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
