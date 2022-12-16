import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/blog/Choose_screen_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/destekAl_page.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/palnlanPage.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/seansGecmisiPAge.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/ucretPage.dart';

import '../../forum/very_soon1.dart';

class PsikologHome extends StatefulWidget {
  const PsikologHome({super.key});

  @override
  State<PsikologHome> createState() => _PsikologHomeState();
}

class _PsikologHomeState extends State<PsikologHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround, işe yaramıyor scroll oldugu cin
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 80.0, right: 80.0, bottom: 10.0, top: 10.0),
                    child: Text(
                      'Profilin Onaylandı',
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildRow(
                Icon(Icons.credit_card, color: Colors.amber, size: 40),
                'Ücret İşlemleri',
                ucretpage(),
                Icon(Icons.watch_later_outlined,
                    color: Color(0xFF5CE1E6), size: 40),
                'Planlanılmış Seanslar',
                PlanPage(),
              ),
              buildRow(
                Icon(Icons.bookmark, color: Color(0xFFEF144E), size: 40),
                'Blog Yazısi Yaz',
                ChooseScreen(),
                Image.asset('assets/images/hand_icon.png'),
                'Bizden Destek Al',
                DestekAlPage(),
              ),
              buildRow(
                Image.asset('assets/images/chat_icon.png'),
                'Psikolog Formu',
                very_soon1(),
                Image.asset('assets/images/hand2_icon.png'),
                'Seans Geçmişiniz',
                SeansGecmisiPAge(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow(icon1, text, pageClassName1, icon2, text2, pageClassName2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                /* decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(1),
                        offset: Offset(80, 0),
                        spreadRadius: -13,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal),
                  ],
                ), */
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(25.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageClassName1));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50, height: 50, child: icon1),
                        Text(text,
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageClassName2));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50, height: 50, child: icon2),
                        Text(
                          text2,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
