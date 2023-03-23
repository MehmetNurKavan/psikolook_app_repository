import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/message/acil_button.dart';

class MessageChatPage extends StatefulWidget {
  const MessageChatPage({Key? key}) : super(key: key);

  @override
  State<MessageChatPage> createState() => _MessageChatPageState();
}

class _MessageChatPageState extends State<MessageChatPage> {
  var _mesajController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChatAppBar(context),
      bottomNavigationBar: buildMessageWriting(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor
          ),
        ),
        child: ListView(
          children: [],
        ),
      ),
    );
  }

  AppBar buildChatAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black87),
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('Klinik Psikolog Rana Akbayram',
            style: TextStyle(color: Colors.black87, fontSize: 16)),
        centerTitle: true,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/woman_picture.png'),
          ),
        ),
      ],
    );
  }

  Container buildMessageWriting() {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AcilDurumPage(),
                    ));
              },
              icon: Image.asset('assets/images/uyari_beyaz-icon.png')),
          Expanded(
            child: TextField(
              controller: _mesajController,
              decoration: InputDecoration(
                  hintText: 'Bir mesaj yazın...',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 18.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Gönder',
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 225, 230), fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
