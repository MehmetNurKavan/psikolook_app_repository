import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/otherHome/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/update_person.dart';

class HomePagePerson extends StatefulWidget {
  final String uid;
  const HomePagePerson({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePagePerson> createState() => _HomePagePersonState();
}

class _HomePagePersonState extends State<HomePagePerson> {
  TextEditingController dateController = TextEditingController();

  var userData = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
    dateController.text = "";
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('OtherUsers')
          .doc(widget.uid)
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
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                    color: Colors.white, backgroundColor: Colors.black))
            : Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.black87),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ));
                              },
                            ),
                            userData['photoUrl'] == null ||
                                    userData['photoUrl'] == ''
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                        'assets/images/default-usr.png'),
                                    radius: MediaQuery.of(context).size.width *
                                        0.15,
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage(userData['photoUrl']),
                                  ),
                            IconButton(
                              icon: const Icon(Icons.settings_outlined , size: 30),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdatPersonPage(uid: widget.uid)));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          userData['username'] ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Expanded(
                      child: ListView(
                        children: [
                          buildCard('Telefon:', "+90 ${userData['number']}"),
                          buildCard('E-posta:', userData['email']),
                          buildCard('Yaş:', userData['age']),
                          buildCard('Cinsiyet:', userData['gender']),
                          buildCard('Meslek:', userData['job']),
                          buildCard('Okul:', userData['schoolName']),
                          buildCard('Bölüm:', userData['schoolJob']),
                          buildCard('Sınıf:', userData['schoolClass']),
                          const SizedBox(height: 20.0)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Card buildCard(text, text2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 65.0,
              child: Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0)),
            ),
            const SizedBox(width: 10.0),
            Flexible(
                child: Text(text2 ?? '',
                    style: const TextStyle(
                        color: Colors.black87, fontSize: 16.0))),
          ],
        ),
      ),
    );
  }
}
