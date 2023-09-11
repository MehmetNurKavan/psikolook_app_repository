import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/event.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologprofil/update_psikolog_profil.dart';
import 'package:psikolook_anasayfa/widget/date_time_card.dart';
import 'package:table_calendar/table_calendar.dart';

class PsikologProfil extends StatefulWidget {
  final String uid;
  const PsikologProfil({Key? key, required this.uid}) : super(key: key);

  @override
  State<PsikologProfil> createState() => _PsikologProfilState();
}

class _PsikologProfilState extends State<PsikologProfil> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late final Map<DateTime, List<Event>> selectedEvents;
  final TextEditingController _eventController = TextEditingController();
  var userData = {};
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
  bool isLoading = false;
  DateTime date = DateTime.now();
  String dateDay0 = DateFormat("dd.MM.yyyy").format(DateTime.now());

  @override
  void initState() {
    getData();
    dateController.text = "";
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
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

  _bioField() {
    if (userData['bio'].toString() != '' &&
        userData['bio'].toString() != 'null') {
      return userData['bio'];
    } else {
      return 'Lütfen düzenleye tıklayıp biyografinizi yazınız!';
    }
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showTime = false;
  bool showVolunteerTime = false;
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

  DateTime getDateTime(DateTime dtm, TimeOfDay tod) {
    if (dateTime == null || dateTime == DateTime.now()) {
      return DateTime.now();
    } else {
      return DateTime(dtm.year, dtm.month, dtm.day, tod.hour, tod.minute);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.Hm();
    return format.format(dt);
  }

  void addToDateAvailable(
    String uid,
    String username,
    String dateDay,
    String addDate,
    DateTime datePublished,
    String photoUrl,
    List interestField,
    String degree,
    String moneyValue,
    String ibanValue,
    String seansDkkValue,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStoreMethods().uploadDateAvailable(
        uid,
        username,
        dateDay,
        addDate,
        datePublished,
        photoUrl,
        interestField,
        degree,
        moneyValue,
        ibanValue,
        seansDkkValue,
      );
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

  void addToDateAvailableVolunteer(
    String uid,
    String username,
    String dateDay,
    String addDate,
    DateTime datePublished,
    String photoUrl,
    List interestField,
    String degree,
    String seansDkkValue,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStoreMethods().uploadDateAvailableVolunteer(
        uid,
        username,
        dateDay,
        addDate,
        datePublished,
        photoUrl,
        interestField,
        degree,
        seansDkkValue,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Gönüllü Seans Eklenildi!',
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
  Widget build(BuildContext context) {
    Future<TimeOfDay> _selectTime(BuildContext context) async {
      final selected = await showTimePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: blueColor,
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
          _eventController.text = getTime(selectedTime).toString();
        });
        if (userData['senasDkkValue'] == '' || userData['moneyValue'] == '') {
          showSnackBar(
            context,
            'Lütfen seans işlemleri kısmına girip seans işlemlerinizi eksiksiz giriniz!',
          );
        } else {
          addToDateAvailable(
            userData['uid'],
            userData['username'],
            dateDay0,
            getTime(selectedTime).toString(),
            getDateTime(_focusedDay, selectedTime),
            userData['photoUrl'],
            userData['interestField'],
            userData['degree'],
            userData['moneyValue'],
            userData['ibanValue'],
            userData['seansDkkValue'],
          );
        }
        Navigator.pop(context);
      }
      if (_eventController.text.isEmpty) {
      } else {
        if (selectedEvents[_selectedDay] != null) {
          selectedEvents[_selectedDay]!.add(
            Event(title: _eventController.text),
          );
        } else {
          selectedEvents[_selectedDay] = [Event(title: _eventController.text)];
        }
      }
      _eventController.clear();
      setState(() {});
      return selectedTime;
    }
    Future<TimeOfDay> _selectVolunteerTime(BuildContext context) async {
      final selected = await showTimePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: blueColor,
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
          _eventController.text = getTime(selectedTime).toString();
        });
        if (userData['senasDkkValue'] == '') {
          showSnackBar(
            context,
            'Lütfen seans işlmeleri kısmına girip seans işlemlerinizi eksiksiz giriniz!',
          );
        } else {
          addToDateAvailableVolunteer(
            userData['uid'],
            userData['username'],
            dateDay0,
            getTime(selectedTime).toString(),
            getDateTime(_focusedDay, selectedTime),
            userData['photoUrl'],
            userData['interestField'],
            userData['degree'],
            userData['seansDkkValue'],
          );
        }
        Navigator.pop(context);
      }
      if (_eventController.text.isEmpty) {
      } else {
        if (selectedEvents[_selectedDay] != null) {
          selectedEvents[_selectedDay]!.add(
            Event(title: _eventController.text),
          );
        } else {
          selectedEvents[_selectedDay] = [Event(title: _eventController.text)];
        }
      }
      _eventController.clear();
      setState(() {});
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
            ? Center(
                child: circleLoading(),
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
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side: const BorderSide(
                                                color: Colors.white,
                                                width: 1.5),
                                          ))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdatePsikologProfil(
                                                        uid: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            left: 10,
                                            right: 10,
                                            bottom: 5),
                                        child: Text(
                                          "Düzenle",
                                          style: TextStyle(fontSize: 16),
                                        ),
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
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Text('BİYOGRAFİNİZ:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(_bioField().toString(),
                                      textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
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
                                  child: userData['interestField'].toString() ==
                                              '' ||
                                          userData['interestField'] == null ||
                                          userData['interestField']
                                                  .toString() ==
                                              'null'
                                      ? const Text(
                                          'Lütfen düzenleye tıklayıp ilgilendiğiniz alanı yazınız!')
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              userData['interestField'].length,
                                          primary: false,
                                          itemBuilder: (context, index) {
                                            return Card(
                                                color: colorsInterstField[
                                                    index >=
                                                            colorsInterstField
                                                                .length
                                                        ? index -
                                                            colorsInterstField
                                                                .length
                                                        : index],
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0,
                                                          left: 30.0,
                                                          right: 30.0),
                                                  child: Text(
                                                      userData['interestField']
                                                          [index]),
                                                ));
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: const [
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              'TAKVİM',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11.0))),
                          child: TableCalendar(
                            firstDay: DateTime(2023),
                            lastDay: DateTime(2030),
                            focusedDay: DateTime.now(),
                            locale: 'tr_TR',
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            weekendDays: const [
                              DateTime.monday,
                              DateTime.sunday
                            ],
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            eventLoader: _getEventsfromDay,
                            calendarFormat: CalendarFormat.month,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                                String formattedDate =
                                    DateFormat("dd.MM.yyyy").format(focusedDay);
                                dateController.text = formattedDate.toString();
                                dateDay0 = formattedDate.toString();
                              });
                            },
                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                            },
                            calendarStyle: const CalendarStyle(
                              isTodayHighlighted: true,
                              selectedDecoration: BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle,
                              ),
                              selectedTextStyle: TextStyle(color: Colors.white),
                            ),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              formatButtonDecoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              formatButtonTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ..._getEventsfromDay(_selectedDay)
                            .map((Event event) => Container()),
                        const SizedBox(height: 15),
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
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      width: 1.5,
                                      color: greyColor)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22.0)),
                                            backgroundColor: Colors.white,
                                            side: const BorderSide(
                                                width: 1.5,
                                                color: greyColor)),
                                              onPressed: () {
                                                _selectTime(context);
                                                showTime = true;
                                              },
                                              child: const Text('Seans Ekle',style: TextStyle(color: Colors.black),)),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22.0)),
                                            backgroundColor: Colors.white,
                                            side: const BorderSide(
                                                width: 1.5,
                                                color: greyColor)),
                                              onPressed: () {
                                                _selectVolunteerTime(context);
                                                showVolunteerTime = true;
                                              },
                                              child: Row(
                                                children: [
                                                  const Text(
                                                      'Gönüllü Seans Ekle', style: TextStyle(color: Colors.black),),
                                                      const SizedBox(width: 15.0),
                                                      Image.asset('assets/images/heart.png', width: 25),
                                                ],
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                );
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
                        Text(
                            dateController.text == "" || dateController == null
                                ? dateDay0
                                : dateController.text,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0)),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('dateAvailable')
                                .where('uid', isEqualTo: widget.uid)
                                .where('dateDay', isEqualTo: dateDay0)
                                .orderBy('datePublished')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: circleLoading(),
                                  ),
                                );
                              } else if (snapshot.hasData &&
                                  snapshot.data!.docs.isNotEmpty) {
                                return SizedBox(
                                  height: snapshot.data!.docs.length == 1
                                      ? 100
                                      : snapshot.data!.docs.length == 2
                                          ? 150
                                          : snapshot.data!.docs.length == 3
                                              ? 200
                                              : snapshot.data!.docs.length == 4
                                                  ? 250
                                                  : snapshot.data!.docs
                                                              .length ==
                                                          5
                                                      ? 300
                                                      : snapshot.data!.docs
                                                                  .length ==
                                                              6
                                                          ? 350
                                                          : 400,
                                  child: ListView.builder(
                                    primary: false,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (ctx, index) => DateTimeCard(
                                      snap: snapshot.data!.docs[index].data(),
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
                                  child:
                                      Text('Henüz bir seans belirlemediniz.'),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: const Text(
                              'Takvimden seçtiğin tarihteki uygun olan\nsaatlerini belirle, yaptığın seanslar\nrenkli kutucuklar olarak gözükecektir.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
