import 'package:flutter/material.dart';

class MessageChatPage extends StatefulWidget {
  const MessageChatPage({super.key});

  @override
  State<MessageChatPage> createState() => _MessageChatPageState();
}

class _MessageChatPageState extends State<MessageChatPage> {
  var _mesajController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      appBar: AppBar(
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
            color: Colors.pink),
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Klinik Psikolog Rana Akbayram',
              style: TextStyle(color: Colors.pink, fontSize: 16)),
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
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text('mesaj içeriği'),
                  Text('mesaj içeriği2'),
                  Text('mesaj içeriği3'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mesajController,
                    cursorColor: Colors.pink,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.pink,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Bir mesaj yazın',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.pink,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
