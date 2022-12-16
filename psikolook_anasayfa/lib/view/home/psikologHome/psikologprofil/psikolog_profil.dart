import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PsikologProfil extends StatefulWidget {
  const PsikologProfil({super.key});

  @override
  State<PsikologProfil> createState() => _PsikologProfilState();
}

class _PsikologProfilState extends State<PsikologProfil> {
  String name = 'Uzman Klinik Psikolog ASLI KAYA';
  String tarih = '16 MART 2020';

  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14 = false;
  bool isChecked15 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;
  bool isChecked18 = false;
  bool isChecked19 = false;
  bool isChecked20 = false;
  bool isChecked21 = false;
  bool isChecked22 = false;
  bool isChecked23 = false;

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/images/woman_picture.png'),
                radius: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(height: 20),
              Text(
                name,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '125',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'TAKİPÇİLER',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '321',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'PAYLAŞIMLAR',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'BLOG YAZILARI',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.black,
                endIndent: MediaQuery.of(context).size.width * 0.05,
                thickness: 0.9,
                indent: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.none,
                minLines: 15,
                maxLines: null,
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);
                  }
                },
                onSubmitted: (String deger) {
                  print("submit " + deger);
                },
                cursorColor: Colors.pink,
                decoration: const InputDecoration(
                  hintText: 'Buraya biyografini yaz',
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
              SizedBox(height: 40),
              TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.none,
                minLines: 7,
                maxLines: null,
                style: TextStyle(color: Colors.white),
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);
                  }
                },
                onSubmitted: (String deger) {
                  print("submit " + deger);
                },
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Buraya ilgilendiğin konuları yaz',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFFFF0390),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'TAKVİM',
                    style: TextStyle(
                        color: Color(0xFFFF0390),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: dateController,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                        color: Color(0xFFFF0390),
                      )),
                  style: TextStyle(
                      color: Color(0xFFFF0390),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  onTap: () async {
                    DateTime? pickedDate = await buildDateTimeCalendar(context);
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat("dd.MM.yyyy").format(pickedDate);

                      setState(() {
                        dateController.text = formattedDate.toString();
                      });
                    } else {
                      print("Not selected");
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Takvimden seçtiğin tarihteki uygun olan saatleri belirle',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
/*               Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  '$tarih',
                  style: TextStyle(
                      color: Color(0xFFFF0390),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ), */
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildSaatRow('08.00', isChecked8),
                      buildSaatRow('09.00', isChecked9),
                      buildSaatRow('10.00', isChecked10),
                      buildSaatRow('11.00', isChecked11),
                      buildSaatRow('12.00', isChecked12),
                      buildSaatRow('13.00', isChecked13),
                      buildSaatRow('14.00', isChecked14),
                      buildSaatRow('15.00', isChecked15),
                      buildSaatRow('16.00', isChecked16),
                      buildSaatRow('17.00', isChecked17),
                      buildSaatRow('18.00', isChecked18),
                      buildSaatRow('19.00', isChecked19),
                      buildSaatRow('20.00', isChecked20),
                      buildSaatRow('21.00', isChecked21),
                      buildSaatRow('22.00', isChecked22),
                      buildSaatRow('23.00', isChecked23),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sadece seçtiğin saatlerde danışan göreceksin.',
                style: TextStyle(
                    color: Color(0xFFFF0390),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF5CE1E6),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 70.0, right: 70.0, bottom: 10, top: 10),
                  child: Text(
                    'TAMAM',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
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
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF0390), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xFFFF0390), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Row buildSaatRow(saat, bool isChecked8) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(saat, style: TextStyle(color: Color(0xFF5CE1E6), fontSize: 22)),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.white,
          activeColor: Color(0xFFFF0390),
          value: isChecked8,
          onChanged: (bool? value) {
            setState(() {
              isChecked8 = value!;
            });
          },
        ),
      ],
    );
  }
}
