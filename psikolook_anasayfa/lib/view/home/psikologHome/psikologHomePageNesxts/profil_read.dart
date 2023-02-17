import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilRead extends StatefulWidget {
  const ProfilRead({super.key});

  @override
  State<ProfilRead> createState() => _ProfilReadState();
}

class _ProfilReadState extends State<ProfilRead> {
  String psikologAvatar = 'assets/images/woman_picture.png';
  String name = 'Uzman Klinik Psikolog Aslı Kaya';
  int history = 1;
  String blogText =
      'Believe in yourself, take on your challenges dig deep within yourswelf to conquer fears. Never let anyone bring your down. You got to keep going.';
  String biyografi =
      'Hacetepe Üniversitesi(ingilizce)Tıp fakültesinden mezun oldu. 1998-2001 yılları marmara üniversitesinde tıp okudu, dekan yardımcılıgna kadar yükseldi, mastur ve foktorasını LOS Angles ta yaptı.Hacetepe Üniversitesi(ingilizce)Tıp fakültesinden mezun oldu. 1998-2001 yılları marmara üniversitesinde tıp okudu, dekan yardımcılıgna kadar yükseldi, mastur ve foktorasını LOS Angles ta yaptı.';
  String ilgiAlani =
      'Anksiteye bozukluğu, stres yönetimi, okb ve aile içi ilişkiler.';
  String blogMetni1 =
      'Henüz hiç paylaşımın yok, hadi paylaşım yaparak kalplere dokun';
  String blogMetni2 =
      'Henüz hiç paylaşımın yok, hadi paylaşım yaparak kalplere dokun';
  String blogMetni3 =
      'Henüz hiç paylaşımın yok, hadi paylaşım yaparak kalplere dokun';
  int time = 1;
  bool isNotVisible = false;
  bool isvisible = true;
  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  String saat = '11.00';
  String saat2 = '17.30';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 236, 241),
              Color.fromARGB(255, 254, 243, 244),
              Color.fromARGB(255, 255, 248, 245),
              Color.fromARGB(255, 255, 252, 247),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
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
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/images/woman_picture.png'),
                              radius: MediaQuery.of(context).size.width * 0.15,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Takip Et',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                    ),
                                  ),
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
                                const Text(
                                  '125',
                                  style: TextStyle(
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
                                const Text(
                                  '321',
                                  style: TextStyle(
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
                                const Text(
                                  '3',
                                  style: TextStyle(
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
                          endIndent: MediaQuery.of(context).size.width * 0.05,
                          thickness: 0.9,
                          indent: MediaQuery.of(context).size.width * 0.05,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: isvisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Column(
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
                            setState(() {
                              isvisible = !isvisible;
                              isNotVisible = !isNotVisible;
                            });
                          },
                          child: const Text(
                            'Psikologun olarak seç',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              biyografi,
                              style: const TextStyle(
                                  color: Colors.black45, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                Text(
                                  ilgiAlani,
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isvisible,
                  child: Container(
                    height: 200,
                    alignment: Alignment.topLeft,
                    child: GridView.count(
                      crossAxisCount: 1,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10),
                      childAspectRatio: 2 / 3,
                      children: [
                        cardx(psikologAvatar, name, history, blogText),
                        cardx(psikologAvatar, name, history, blogText),
                        cardx(psikologAvatar, name, history, blogText),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: isNotVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          const Text('UYGUN SAATLER:',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 250,
                            child: TextField(
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
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
                              onTap: () async {
                                DateTime? pickedDate =
                                    await buildDateTimeCalendar(context);
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat("dd.MM.yyyy")
                                          .format(pickedDate);

                                  setState(() {
                                    dateController.text =
                                        formattedDate.toString();
                                  });
                                } else {
                                  print("Not selected");
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Column(
                              children: [
                                buildCheckedBox1(),
                                buildCheckedBox2(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Seçmiş olduğun gün ve saatte psikologunun belirleyeceği haftaya kadar online psikolojik danişanlık hizmeti alıyorsun. Zoom linkini psikologuun sayfasıondaki görüşme linkini kısımına ekleyecektir. Kontrol etmeyi unutma :))',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                height: 1.5),
                          ),
                          const SizedBox(height: 20),
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
                                  left: 30.0, right: 30.0, bottom: 10, top: 10),
                              child: Text(
                                'TAMAM',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )),
                const SizedBox(height: 50),
              ],
            ),
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
        Text(saat, style: const TextStyle(fontSize: 28)),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.transparent,
          activeColor: const Color(0xFFFF0390),
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
        Text(saat2, style: const TextStyle(fontSize: 28)),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.transparent,
          activeColor: const Color(0xFFFF0390),
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
            //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
