import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologprofil/psikolog_profil.dart';
import 'package:psikolook_anasayfa/widget/date_time_card2.dart';

class UpdatePsikologProfil extends StatefulWidget {
  final String uid;
  const UpdatePsikologProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<UpdatePsikologProfil> createState() => _UpdatePsikologProfilState();
}

class _UpdatePsikologProfilState extends State<UpdatePsikologProfil> {
  String dateDay0 = '';
  TextEditingController dateController = TextEditingController();

  TextEditingController bioController = TextEditingController();
  TextEditingController interestFieldController = TextEditingController();
  var userData = {};
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
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
          .collection('PsikologUsers')
          .doc(widget.uid)
          .get();

      // get blog lENGTH
      var blogSnap = await FirebaseFirestore.instance
          .collection('blogs')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      blogLen = blogSnap.docs.length;
      postLen = postSnap.docs.length;

      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
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

  void updateBioandInterestet(bio, interestField) async {
    // set loading to true
    setState(() {
      isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods()
        .updatePsikologBioandInterestet(bio: bio, interestField: interestField);
    // if string returned is sucess, user has been created
    if (res == "Kayıt Başarılı") {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  void addToDateAvailable(
      String uid, String username, String dateDay, String addDate) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStoreMethods()
          .uploadDateAvailable(uid, username, dateDay, addDate);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Eklenildi!',
        );
      } else {
        showSnackBar(context, res);
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

  _bioField() {
    if (userData['bio'].toString() != '' && userData['bio'].toString() != 'null') {
      return userData['bio'];
    } else {
      return 'Buraya biyografini yaz';
    }
  }

  _interestField() {
    if (userData['interestField'].toString() != '' && userData['interestField'].toString() != 'null') {
      return userData['interestField'];
    } else {
      return 'Buraya ilgilendiğin konuları yaz';
    }
  }

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
    interestFieldController.dispose();
    dateController.dispose();
  }

  _onPressed() {
    String _bio = userData['bio'];
    String _interestField = userData['interestField'];
    if (bioController.text != _bio ||
        interestFieldController.text == _interestField) {
      updateBioandInterestet(bioController.text.trim(), _interestField);
    } else if (bioController.text == _bio ||
        interestFieldController.text != _interestField) {
      updateBioandInterestet(_bio, interestFieldController.text.trim());
    } else {
      updateBioandInterestet(
          bioController.text.trim(), interestFieldController.text.trim());
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PsikologProfil(uid: FirebaseAuth.instance.currentUser!.uid)));
  }

  @override
  Widget build(BuildContext context) {
    final PsikologUserProvider userProvider =
        Provider.of<PsikologUserProvider>(context);

    // Select for Time
    Future<TimeOfDay> _selectTime(BuildContext context) async {
      final selected = await showTimePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialTime: selectedTime,
      );
      if (selected != null && selected != selectedTime) {
        setState(() {
          selectedTime = selected;
        });
        addToDateAvailable(
          userProvider.getUser.uid,
          userProvider.getUser.username,
          dateDay0,
          getTime(selectedTime).toString(),
        );
      }
      return selectedTime;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Colors.white,
                                        size: 30)),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(
                                    userData['photoUrl'],
                                  ),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.15,
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        userData['username'],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '$followers',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'TAKİPÇİLER',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$postLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'PAYLAŞIMLAR',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '$blogLen',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    const Text(
                                      'BLOG YAZILARI',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              color: Colors.white54,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.05,
                              thickness: 0.9,
                              indent: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text('BİYOGRAFİNİZ:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: bioController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.none,
                                    minLines: 3,
                                    maxLines: null,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: _bioField().toString(),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text('İLGİLENDİĞİ ALANLAR:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: interestFieldController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.none,
                                    minLines: 3,
                                    maxLines: null,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: _interestField().toString(),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Seanslarınızı Belirleyiniz',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: dateController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintText: 'Tarihi giriniz',
                                hintStyle: TextStyle(fontSize: 30,color: Colors.black87),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.black87,
                                )),
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            onTap: () async {
                              DateTime? pickedDate = await _selectDate(context);
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat("dd.MM.yyyy").format(pickedDate);

                                setState(() {
                                  dateController.text =
                                      formattedDate.toString();
                                  dateDay0 = formattedDate.toString();
                                });
                              } else {
                                print("Henüz tarih seçmediniz!");
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Takvimden seçtiğin tarihteki\nuygun olan saatleri belirleyiniz',
                                style: TextStyle(fontSize: 12),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22.0)),
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Color.fromARGB(255, 201, 201, 201))),
                                onPressed: () {
                                  /* _selectTime(context); */
                                  _selectTime(context);
                                  showTime = true;
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '🕘  Seans Ekle',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.0)),
                            child: FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('dateAvailable')
                                  .where('uid', isEqualTo: widget.uid)
                                  .where('dateDay',
                                      isEqualTo: dateController.text)
                                  .get(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                } else if (snapshot.hasData != null) {
                                  if (snapshot.data!.docs.length > 0) {
                                    return SizedBox(
                                      height: snapshot.data!.docs.length == 1
                                          ? 150
                                          : MediaQuery.of(context).size.height *
                                              0.4,
                                      child: ListView.builder(
                                        primary: false,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (ctx, index) =>
                                            DateTimeCard2(
                                          snap:
                                              snapshot.data!.docs[index].data(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          bottom: 20,
                                          top: 20),
                                      child: Text(
                                          'Henüz bir seans belirlemediniz.'),
                                    );
                                  }
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Text(
                              'Sadece seçtiğin saatlerde danışan göreceksin.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: ElevatedButton(
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
                              onPressed: _onPressed,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 70.0,
                                    right: 70.0,
                                    bottom: 10,
                                    top: 10),
                                child: Text(
                                  'Kaydet',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  /* bool showDateTime = false; */

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
              primary: Colors.black,
              onPrimary: Colors.white,
              onSurface: Colors.black,
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

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.Hm();
    return format.format(dt);
  }
}
