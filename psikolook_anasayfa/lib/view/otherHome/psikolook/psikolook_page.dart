import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/cok_yakinda_page.dart';
import 'package:psikolook_anasayfa/view/otherHome/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/otherHome/profil/person_page.dart';
import 'package:psikolook_anasayfa/view/partner/bilimekatki/bilime_katki_page.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/toplulukPage.dart';
import 'package:psikolook_anasayfa/widget/psikolog_card.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/widget/psikolog_card_skelton.dart';

class PsikolookPage extends StatefulWidget {
  const PsikolookPage({Key? key}) : super(key: key);
  @override
  State<PsikolookPage> createState() => _PsikolookPageState();
}

class _PsikolookPageState extends State<PsikolookPage> {
  TextEditingController searchController = TextEditingController();
  bool isShow = false;
  bool isVisible = true;
  bool isNotVisible = false;
  String degree = 'Ünvan';
  String interestField = 'Uzmanlık Alanı';
  String dateDay = 'Randevu Tarihi';
  bool isShowUsers = false;
  bool isLoading = false;
  var userData = {};
  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('OtherUsers')
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

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor[backGroundColor.length - 1],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: builHomeRow(context),
      floatingActionButton: buildPsikolookButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        child: Column(
          children: [
            buildFilterAppBar(context),
            userData['castawayConfirmation'] != null &&
                    userData['castawayConfirmation'] == true
                ? SizedBox(
                  width: MediaQuery.of(context).size.height*0.8,
                  child: const Card(
                    elevation: 0,
                    margin: EdgeInsets.only(left:30.0, right: 30.0, top: 15.0),
                    color: pinkColor,
                      child: Padding(
                        padding: EdgeInsets.only(left:30.0, right: 30.0, bottom: 15.0, top: 15.0),
                        child: Text('Ücretsiz Seanslardan Yararlanabilirsiniz',style: TextStyle(color: Colors.white)),
                      )
                    ),
                )
                : Container(),
            isShowUsers
                ? Expanded(
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('PsikologUsers')
                          .where('username',
                              isGreaterThanOrEqualTo: searchController.text)
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: circleLoading());
                        } else if (snapshot.hasData &&
                            snapshot.data!.docs.isNotEmpty) {
                          return ListView.builder(
                            itemCount: (snapshot.data! as dynamic).docs.length,
                            itemBuilder: (context, index) {
                              return PsikologCard(
                                snap: snapshot.data!.docs[index].data(),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: Text(
                                  'Seçilen Filtreye Uygun Kullanıcı Bulunamadı'));
                        }
                      },
                    ),
                  )
                : Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                    stream: dateDay == 'Randevu Tarihi' &&
                            degree == 'Ünvan' &&
                            interestField == 'Uzmanlık Alanı'
                        ? FirebaseFirestore.instance
                            .collection('dateAvailable')
                            .where('datePublished',
                                isGreaterThanOrEqualTo: DateTime.now())
                            .snapshots()
                        : dateDay != 'Randevu Tarihi' &&
                                degree == 'Ünvan' &&
                                interestField == 'Uzmanlık Alanı'
                            ? FirebaseFirestore.instance
                                .collection('dateAvailable')
                                .where('dateDay', isEqualTo: dateDay)
                                .where('datePublished',
                                    isGreaterThanOrEqualTo: DateTime.now())
                                .snapshots()
                            : dateDay == 'Randevu Tarihi' &&
                                    degree != 'Ünvan' &&
                                    interestField == 'Uzmanlık Alanı'
                                ? FirebaseFirestore.instance
                                    .collection('dateAvailable')
                                    .where('degree', isEqualTo: degree)
                                    .where('datePublished',
                                        isGreaterThanOrEqualTo: DateTime.now())
                                    .snapshots()
                                : dateDay == 'Randevu Tarihi' &&
                                        degree == 'Ünvan' &&
                                        interestField != 'Uzmanlık Alanı'
                                    ? FirebaseFirestore.instance
                                        .collection('dateAvailable')
                                        .where('interestField',
                                            arrayContains: interestField)
                                        .where('datePublished',
                                            isGreaterThanOrEqualTo:
                                                DateTime.now())
                                        .snapshots()
                                    : dateDay == 'Randevu Tarihi' &&
                                            degree != 'Unvan' &&
                                            interestField != 'Uzmanlık Alanı'
                                        ? FirebaseFirestore.instance
                                            .collection('dateAvailable')
                                            .where('degree', isEqualTo: degree)
                                            .where('interestField',
                                                arrayContains: interestField)
                                            .where('datePublished',
                                                isGreaterThanOrEqualTo:
                                                    DateTime.now())
                                            .snapshots()
                                        : dateDay != 'Randevu Tarihi' &&
                                                degree != 'Unvan' &&
                                                interestField !=
                                                    'Uzmanlık Alanı'
                                            ? FirebaseFirestore.instance
                                                .collection('dateAvailable')
                                                .where('degree',
                                                    isEqualTo: degree)
                                                .where('interestField',
                                                    arrayContains:
                                                        interestField)
                                                .where('dateDay',
                                                    isEqualTo: dateDay)
                                                .where('datePublished',
                                                    isGreaterThanOrEqualTo:
                                                        DateTime.now())
                                                .snapshots()
                                            : dateDay != 'Randevu Tarihi' &&
                                                    degree != 'Ünvan' &&
                                                    interestField ==
                                                        'Uzmanlık Alanı'
                                                ? FirebaseFirestore.instance
                                                    .collection('dateAvailable')
                                                    .where('degree',
                                                        arrayContains: degree)
                                                    .where('dateDay',
                                                        isEqualTo: dateDay)
                                                    .where('datePublished',
                                                        isGreaterThanOrEqualTo:
                                                            DateTime.now())
                                                    .snapshots()
                                                : FirebaseFirestore.instance
                                                    .collection('dateAvailable')
                                                    .where('interestField',
                                                        arrayContains:
                                                            interestField)
                                                    .where('dateDay',
                                                        isEqualTo: dateDay)
                                                    .where('datePublished',
                                                        isGreaterThanOrEqualTo:
                                                            DateTime.now())
                                                    .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> dateAvailableSnapshot) {
                      if (dateAvailableSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.9,
                          child: const PsikologCardSkelton()));
                      } else if (dateAvailableSnapshot.hasData &&
                          dateAvailableSnapshot.data!.docs.isNotEmpty) {
                        // Filter all posts by userId
                        Map<String, dynamic> dateAvailableMap = {};
                        dateAvailableSnapshot.data!.docs.forEach((doc) {
                          String userId = doc['uid'];
                          if (!dateAvailableMap.containsKey(userId)) {
                            dateAvailableMap[userId] = doc.data();
                          }
                        });
                        // Convert the Map to a List
                        List<dynamic> postList =
                            dateAvailableMap.values.toList();
                        return ListView.builder(
                          itemCount: postList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PsikologCard(
                              snap: postList[index],
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text(
                                'Seçilen Filtreye Uygun Kullanıcı Bulunamadı'));
                      }
                    },
                  )),
          ],
        ),
      ),
    );
  }

  Widget buildFilterAppBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 35.0, left: 15.0, right: 15.0, bottom: 15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.decal,
                  colors: purpleColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: DecoratedBox(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: greyColor, width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                      child: TextButton(
                        child: Text(dateDay,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 12)),
                        onPressed: () async {
                          DateTime? pickedDate = await _selectDate(context);
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat("dd.MM.yyyy").format(pickedDate);
                            setState(() {
                              dateDay = formattedDate.toString();
                            });
                          } else {
                            print("Henüz tarih seçmediniz!");
                          }
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: DecoratedBox(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: greyColor, width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: DropdownButton(
                          menuMaxHeight:
                              MediaQuery.of(context).size.height * 0.5,
                          icon: const SizedBox(),
                          isExpanded: true,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12),
                          items: unvan
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              degree = newValue!;
                            });
                          },
                          hint: Text(degree,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 12)),
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: DecoratedBox(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: greyColor, width: 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: DropdownButton(
                          icon: const SizedBox(),
                          isExpanded: true,
                          menuMaxHeight:
                              MediaQuery.of(context).size.height * 0.5,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12),
                          items: ilgiAlani
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              interestField = newValue!;
                            });
                          },
                          hint: Text(interestField,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 12)),
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              controller: searchController,
              maxLines: 1,
              onFieldSubmitted: (String _) {
                setState(() {
                  isShowUsers = true;
                });
                print(_);
              },
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Ara',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Container builHomeRow(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: Image.asset('assets/images/home_icon.png'),
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BilimeKatkiPage()));
              },
              icon: Image.asset('assets/images/lab_icon.png'),
              iconSize: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToplulukPage()));
              },
              icon: Image.asset('assets/images/perosn_two_icon.png'),
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePagePerson(
                            uid: FirebaseAuth.instance.currentUser!.uid)));
              },
              icon: Image.asset('assets/images/person_icon.png'),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: blueColor,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }
}
