import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/date_time_card.dart';

class UpdatePsikologProfil extends StatefulWidget {
  final String uid;
  const UpdatePsikologProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<UpdatePsikologProfil> createState() => _UpdatePsikologProfilState();
}

class _UpdatePsikologProfilState extends State<UpdatePsikologProfil> {
  bool isChecked = false;
  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  int i = 0;

  TextEditingController dateController = TextEditingController();

  TextEditingController bioController = TextEditingController();
  TextEditingController interestFieldController = TextEditingController();

  var userData = {};
  var timeData = {};
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
      timeData = userSnap.data()!['addDate'];
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

  void addToDateAveliable(
      String uid, String username, String dateDay, List<void> addDate) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStoreMethods()
          .uploadDateAvailable(uid, username, dateDay, addDate);
      if (res == "success") {
        setState(() {
          isLoading = false;
          Navigator.pop(context);
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

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
    interestFieldController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PsikologUserProvider userProvider =
        Provider.of<PsikologUserProvider>(context);
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
                          TextField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.none,
                            minLines: 5,
                            maxLines: null,
                            controller: bioController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: 'Buraya biyografini yaz',
                              hintStyle: TextStyle(color: Colors.black45),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
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
                                    style: const TextStyle(color: Colors.white),
                                    cursorColor: Colors.black,
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Buraya ilgilendiğin konuları yaz',
                                      hintStyle:
                                          TextStyle(color: Colors.black45),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
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
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 15.0, bottom: 10.0, top: 10.0),
                            child: Text(
                              'TAKVİM',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
                                prefixIcon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.black,
                                )),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            onTap: () async {
                              DateTime? pickedDate = await _selectDate(context);
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat("dd.MM.yyyy").format(pickedDate);
                                
                                setState(() {
                                  dateController.text =
                                      formattedDate.toString();
                                });
                              } else {
                                print("Henüz tarih seçmediniz!");
                              }
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Text(
                              'Takvimden seçtiğin tarihteki uygun olan saatleri belirle',
                              style: TextStyle(fontSize: 12),
                            ),
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
                                'Ekle',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          /* Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      showTime
                                          ? Center(
                                              child: buildCheckedBox1(
                                                  getTime(selectedTime)))
                                          : const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ), */
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView(
                              children: [
                                FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('dateAvaliable')
                                      .where('uid', isEqualTo: widget.uid)
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
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: GridView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: (snapshot.data! as dynamic)
                                            .docs
                                            .length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 1.5,
                                          childAspectRatio: 1,
                                        ),
                                        itemBuilder: (context, index) {
                                          return DateTimeCard(
                                              snap: snapshot.data!.docs[index]
                                                  .data());
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Text(timeData.toString()),
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
                              onPressed: () {
                                addToDateAveliable(
                                  userProvider.getUser.uid,
                                  userProvider.getUser.username,
                                  dateController.toString(),
                                  [selectedTime],
                                );
                              },
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

/*   Future<DateTime?> buildDateTimeCalendar(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  } */

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

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
              primary: Colors.black, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
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

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
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
    }
    return selectedTime;
  }

  /* // select date time picker

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  } */

  /* String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'Günü seçiniz';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  } */

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
    final format = DateFormat.jm();
    return format.format(dt);
  }
}
