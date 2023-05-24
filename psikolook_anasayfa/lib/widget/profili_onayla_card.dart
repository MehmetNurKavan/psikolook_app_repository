import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/adminpanel/confirm_page.dart';

class ConfirmationCard extends StatefulWidget {
  final snap;
  const ConfirmationCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<ConfirmationCard> createState() => _ConfirmationCardState();
}

class _ConfirmationCardState extends State<ConfirmationCard> {
  @override
  void initState() {
    super.initState();
  }

  String confirmText() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return 'ONAYLANDI';
    } else {
      return 'ONAY GEREKMEKTE';
    }
  }

  Color confirmColor() {
    if (widget.snap['confirmation'] == true ||
        widget.snap['confirmation'].toString() == 'true') {
      return Colors.black;
    } else {
      return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.snap['username'],
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                        fontStyle: FontStyle.italic),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      widget.snap['photoUrl'],
                    ),
                    radius: MediaQuery.of(context).size.width * 0.08,
                  ),
                ],
              ),
              const Divider(color: Colors.black87),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ConfirmPage(snap: widget.snap)));
                },
                child: Text(
                  confirmText(),
                  style: TextStyle(fontSize: 18, color: confirmColor()),
                ),
              ),
              const Divider(color: Colors.black87),
            ],
          ),
        ),
      ),
    );
  }
}
