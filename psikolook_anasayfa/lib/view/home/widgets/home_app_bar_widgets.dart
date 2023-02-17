import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/message/message_page.dart';

class buildHomeAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 248, 230, 228),
      elevation: 0,
      actions: <Widget>[
        FloatingActionButton.small(
          backgroundColor: Colors.transparent,
          elevation: 0,
          tooltip: 'Mesajlar',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MessagePage()));
          },
          child: Image.asset('assets/images/chat_icon.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}
