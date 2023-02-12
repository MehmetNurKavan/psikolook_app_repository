import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/drawer/cikisyap_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/destekAl_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/hakkimzda_page.dart';
import 'package:psikolook_anasayfa/view/home/drawer/kvkk_page.dart';
class buildDrawerWidget extends StatelessWidget {
  const buildDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.4),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Drawer(
          elevation: 0,
          width: MediaQuery.of(context).size.width * 0.28,
          backgroundColor: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                color: Colors.white,
                iconSize: 34,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HakkimizdaPage(),
                      ));
                },
                child: const Text(
                  'HAKKIMIZDA',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DestekAlPage(),
                      ));
                },
                child: const Text(
                  'DESTEK',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DestekAlPage(),
                      ));
                },
                child: const Text(
                  'İLETİŞİM',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KvkkPage(),
                      ));
                },
                child: const Text(
                  'KVKK',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CikisYapPage()),
                  );
                },
                child: const Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
