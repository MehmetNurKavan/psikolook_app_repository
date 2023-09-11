import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/event.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/my_posts_page.dart';
import 'package:psikolook_anasayfa/widget/blog_card.dart';
import 'package:psikolook_anasayfa/widget/blog_card_skelton.dart';
import 'package:psikolook_anasayfa/widget/date_time_card2.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';
import 'package:psikolook_anasayfa/widget/post_card_skelton.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfilRead extends StatefulWidget {
  final uid;
  const ProfilRead({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfilRead> createState() => _ProfilReadState();
}

class _ProfilReadState extends State<ProfilRead> {
  TextEditingController dateController = TextEditingController();
  int blogLen = 0;
  int postLen = 0;
  int followers = 0;
  bool isFollowing = false;
  bool isLoading = false;
  bool isVisible = true;
  bool isNotVisible = false;
  bool isChecked = false;
  bool isChecked2 = false;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late final Map<DateTime, List<Event>> selectedEvents;
  TextEditingController _eventController = TextEditingController();
  String dateDay0 = DateFormat("dd.MM.yyyy").format(DateTime.now());
  var userData = {};

  @override
  void initState() {
    getData();
    dateController.text = "";
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
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
          .where('uid', isEqualTo: widget.uid)
          .get();
      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.uid)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                                    icon: const Icon(Icons.arrow_back,
                                        color: Colors.white70, size: 30)),
                                userData['photoUrl'] == null ||
                                        userData['photoUrl'] == ''
                                    ? const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            'assets/images/default-usr.png'),
                                        radius: 40,
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            NetworkImage(userData['photoUrl']),
                                      ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        userData['username'],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      FirebaseAuth.instance.currentUser!.uid ==
                                              widget.uid
                                          ? Container()
                                          : isFollowing
                                              ? ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      Colors.white,
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    await FireStoreMethods()
                                                        .followUser(
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid,
                                                      widget.uid,
                                                    );
                                                    setState(() {
                                                      isFollowing = false;
                                                      followers--;
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Takiptesin',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: blueColor),
                                                  ),
                                                )
                                              : ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      Colors.white,
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    await FireStoreMethods()
                                                        .followUser(
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid,
                                                      widget.uid,
                                                    );
                                                    setState(() {
                                                      isFollowing = true;
                                                      followers++;
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Takip Et',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black54),
                                                  ),
                                                )
                                    ],
                                  ),
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
                                      followers.toString(),
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
                                      postLen.toString(),
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
                                      blogLen.toString(),
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
                    const SizedBox(height: 30.0),
                    Visibility(
                      visible: isVisible,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30),
                            child: Column(
                              children: [
                                userData['admin'] == null
                                    ? ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.black,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                            isNotVisible = !isNotVisible;
                                          });
                                        },
                                        child: const Text(
                                          'Psikologun olarak seç',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      )
                                    : Container(),
                                userData['admin'] == null
                                    ? const SizedBox(height: 20.0)
                                    : Container(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(11.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      userData['bio'] == '' ||
                                              userData['bio'] == null
                                          ? 'Henüz Biyografi Belirtilmemiş.'
                                          : userData['bio'],
                                      style: const TextStyle(
                                          color: Colors.black45, fontSize: 16),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                userData['admin'] == null
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(11.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              const Text('İLGİLENDİĞİ ALANLAR:',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      height: 50,
                                                      child: userData['interestField']
                                                                      .toString() ==
                                                                  '' ||
                                                              userData[
                                                                      'interestField'] ==
                                                                  null ||
                                                              userData['interestField']
                                                                      .toString() ==
                                                                  'null'
                                                          ? const Text(
                                                              'Lütfen düzenleye tıklayıp ilgilendiğiniz alanı yazınız!')
                                                          : ListView.builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount: userData[
                                                                      'interestField']
                                                                  .length,
                                                              primary: false,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Card(
                                                                    color: colorsInterstField[index >=
                                                                            colorsInterstField
                                                                                .length
                                                                        ? index -
                                                                            colorsInterstField
                                                                                .length
                                                                        : index],
                                                                    elevation:
                                                                        0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              8.0,
                                                                          bottom:
                                                                              8.0,
                                                                          left:
                                                                              15.0,
                                                                          right:
                                                                              15.0),
                                                                      child: Text(
                                                                          userData['interestField']
                                                                              [
                                                                              index]),
                                                                    ));
                                                              },
                                                            ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          userData['admin'] == null
                              ? const SizedBox(height: 30.0)
                              : Container(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('blogs')
                                  .where('uid', isEqualTo: widget.uid)
                                  .orderBy('datePublished', descending: true)
                                  .get(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: BlogCardSkelton(),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.docs.isNotEmpty) {
                                  return SizedBox(
                                    child: GridView.builder(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      scrollDirection: Axis.horizontal,
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
                                        return BlogCard(
                                          snap:
                                              snapshot.data!.docs[index].data(),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          SizedBox(
                            height: 250,
                            child: FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('posts')
                                  .where('uid', isEqualTo: widget.uid)
                                  .orderBy('datePublished', descending: true)
                                  .get(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: PostCardSkelton(),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.docs.isNotEmpty) {
                                  return SizedBox(
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          snapshot.data!.docs.length ?? 0,
                                      itemBuilder: (ctx, index) => SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: PostCard(
                                          snap:
                                              snapshot.data!.docs[index].data(),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: isNotVisible,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  SizedBox(width: 10),
                                  Text(
                                    'TAKVİM',
                                    style: TextStyle(
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(11.0))),
                                child: TableCalendar(
                                  firstDay: DateTime.now(),
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
                                          DateFormat("dd.MM.yyyy")
                                              .format(focusedDay);
                                      dateController.text =
                                          formattedDate.toString();
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
                                    selectedTextStyle:
                                        TextStyle(color: Colors.white),
                                  ),
                                  headerStyle: const HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    formatButtonTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              ..._getEventsfromDay(_selectedDay)
                                  .map((Event event) => Container()),
                              const SizedBox(height: 30),
                              const Text('UYGUN SAATLER:',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 30),
                              Text(
                                  dateController.text == "" ||
                                          dateController == null
                                      ? dateDay0
                                      : dateController.text,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
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
                                      .where('datePublished',
                                          isGreaterThanOrEqualTo:
                                              DateTime.now())
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
                                                : snapshot.data!.docs.length ==
                                                        3
                                                    ? 200
                                                    : snapshot.data!.docs
                                                                .length ==
                                                            4
                                                        ? 250
                                                        : snapshot.data!.docs
                                                                    .length ==
                                                                5
                                                            ? 300
                                                            : snapshot
                                                                        .data!
                                                                        .docs
                                                                        .length ==
                                                                    6
                                                                ? 350
                                                                : 400,
                                        child: ListView.builder(
                                          primary: false,
                                          itemCount:
                                              snapshot.data.docs.length ?? 0,
                                          itemBuilder: (ctx, index) =>
                                              DateTimeCard2(
                                            snap: snapshot.data!.docs[index]
                                                .data(),
                                            uid: widget.uid,
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
                                            'Henüz Bir Seans Belirtilmemiş.'),
                                      );
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Seçmiş olduğun gün ve saatte psikologunun belirleyeceği haftaya kadar online psikolojik danişanlık hizmeti alıyorsun. Görüşme linkini psikologun sayfasıondaki görüşme linkini kısımına ekleyecektir. Kontrol etmeyi unutma :))',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    height: 1.5),
                              ),
                              /*const SizedBox(height: 30),
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
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 10,
                                      top: 10),
                                  child: Text(
                                    'TAMAM',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ), */
                            ],
                          ),
                        )),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
      ),
    );
  }

  Row buildCheckedBox1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(),
        const Text('10.00', style: TextStyle(fontSize: 28)),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.transparent,
          activeColor: pinkColor,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const SizedBox(),
      ],
    );
  }

  Row buildCheckedBox2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(),
        const Text('11.00', style: TextStyle(fontSize: 28)),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.transparent,
          activeColor: pinkColor,
          value: isChecked2,
          onChanged: (bool? value) {
            setState(() {
              isChecked2 = value!;
            });
          },
        ),
        const SizedBox(),
      ],
    );
  }

  Card cardx(psikologAvatar, name, history, blogText) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            //height: MediaQuery.of(context).size.height * 0.07,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(psikologAvatar),
                ),
                title: Text(name),
                subtitle: Text('$history hour ago'),
                trailing: const Icon(Icons.keyboard_arrow_down,
                    color: Colors.black38),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                blogText,
                style: const TextStyle(fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> buildDateTimeCalendar(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              onPrimary: Colors.white,
              onSurface: Colors.black,
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
  }

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
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
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
  // select date time picker

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
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
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
    final format = DateFormat.jm();
    return format.format(dt);
  }
}
