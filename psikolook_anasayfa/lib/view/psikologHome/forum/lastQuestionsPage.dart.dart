import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/psikologHome/forum/psikolook_forum.dart';

class LastQuestionPage extends StatelessWidget {
  const LastQuestionPage({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Başlıklar",
                    style: TextStyle(fontSize: 40, color: Colors.red.shade300),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
