import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/forum/psikolook_forum.dart';

class LastSections extends StatelessWidget {
  const LastSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PsikolookformPage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50, right: 20),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.manage_search_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sorular",
                    style: TextStyle(fontSize: 40, color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
