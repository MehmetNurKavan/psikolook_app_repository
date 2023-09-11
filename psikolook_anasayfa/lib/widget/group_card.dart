import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/partner/topluluk/chat_page.dart';

class GroupCard extends StatefulWidget {
  final nickname;
  final snap;
  const GroupCard({
    Key? key,
    required this.nickname,
    required this.snap,
  }) : super(key: key);

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                    nickname : widget.nickname,
                    snap: widget.snap)));
        },
        child: Card(
          child: Center(
              child: Text(
            widget.snap['toplulukTitle'],
            style: const TextStyle(fontSize: 21, color: Colors.black87),
          )),
        ),
      ),
    );
  }
}
