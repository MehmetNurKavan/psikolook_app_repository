import 'dart:math';

import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/adminHome/confirm_profile.dart';
import 'package:psikolook_anasayfa/view/adminHome//pdf_vew.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class ConfirmPage extends StatefulWidget {
  final snap;
  const ConfirmPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  void updateUser(bool confirmation) async {
    String uid = widget.snap['uid'];
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().updatePsikologUserConfirm(
      uid: uid,
      confirmation: confirmation,
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  void updateUser2(bool confirmation) async {
    String uid = widget.snap['uid'];
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().updatePsikologUserConfirm(
      uid: uid,
      confirmation: confirmation,
    );
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  String confirmText() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return 'ONAYLANDI';
    } else {
      return 'ONAY GEREKMEKTE';
    }
  }

  String confirmText2() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return 'ONAYI KALDIR';
    } else {
      return 'ONAYLA';
    }
  }

  Color confirmColor() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return Colors.black;
    } else {
      return Colors.pink;
    }
  }

  Future<dynamic> onPressed() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Profil İznini Kaldır'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              onPressed: () {
                updateUser2(false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmProfilePage()));
              },
              child: const Text('Kaldır'),
            ),
          ],
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Profili Onayla'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              onPressed: () {
                updateUser(true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmProfilePage()));
              },
              child: const Text('ONAYLA'),
            ),
          ],
        ),
      );
    }
  }

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
            Navigator.pop(context);
          },
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.snap['username'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.italic),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                widget.snap['photoUrl'],
                              ),
                              radius: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black87),
                        Text(
                          confirmText(),
                          style: TextStyle(fontSize: 18, color: confirmColor()),
                        ),
                        const Divider(color: Colors.black87),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PdfView(url: widget.snap['pdfUrl'])));
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 50.0, right: 50.0, bottom: 10.0, top: 10.0),
                      child: Text('PDF BELGESİNİ GÖRÜNTÜLE',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15.0),
                    Text('E-Posta'),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListTile(title: Text(widget.snap['email'] ?? '')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15.0),
                    Text('Telefon'),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListTile(
                    title: Text(widget.snap['number'] ?? ''),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15.0),
                    Text('Yaş'),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListTile(
                    title: Text(widget.snap['age'].toString()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15.0),
                    Text('Cinsiyet'),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListTile(
                    title: Text(widget.snap['gender'] ?? ''),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15.0),
                    Text(
                        'Yüksesk Lisans veya\nDoktora Öğrencisiyseniz Okul Adı'),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListTile(
                    title: Text(widget.snap['schoolName'] ?? ''),
                  ),
                ),
                Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Text('Ünvanı:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 50,
                                  child: 
                                  widget.snap['degree'].toString() == '' || widget.snap['degree'] == null || widget.snap['degree'].toString() == 'null' ?
                                  const Text('Derecesi bulunamadı!')
                                  :
                                      ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.snap['degree'].length,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 30.0,right: 30.0),
                                            child: Text(widget.snap['degree'][index]),
                                          ));
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Text('İLGİLENDİĞİ ALANLAR:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 50,
                                  child: 
                                  widget.snap['interestField'].toString() == '' || widget.snap['interestField'] == null || widget.snap['interestField'].toString() == 'null' ?
                                  const Text('İlgi Alnı Bulunamadı!')
                                  :
                                      ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.snap['interestField'].length,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 30.0,right: 30.0),
                                            child: Text(widget.snap['interestField'][index]),
                                          ));
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black)),
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 21),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Text(confirmText2()),
                  ),
                  onPressed: () {
                    onPressed();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
