import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/gecici/constant/constants.dart';
import 'dart:math' as math show Random;

class MessageBubble extends StatefulWidget {
  MessageBubble({
    Key? key,
    this.text,
    this.sender,
    this.isMe,
    this.timestamp,
  }) : super(key: key);

  final String? text;
  final String? sender;
  final bool? isMe;
  final Timestamp? timestamp;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  List colors = [Color(0xFFA2CED9), Color(0xFFEED0DD), Color(0xFFD5CDED)];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            widget.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Text(widget.sender!, style: Constants.stamps),
          ),
          Material(
            elevation: 5,
            shadowColor: Colors.white24,
            borderRadius: widget.isMe!
                ? Constants.myChatBubbleRadius
                : Constants.otherChatBubbleRadius,
            color: widget.isMe!
                ? Color.fromARGB(254, 251, 245, 236)
                : colors[math.Random().nextInt(colors.length)],
            child: Padding(
              padding: Constants.bubblePadding,
              child: Text(
                widget.text!,
                style: TextStyle(
                  fontSize: 15,
                  color: widget.isMe! ? Colors.black87 : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Text(DateFormat('dd MMM kk:mm').format(widget.timestamp!.toDate()),
              style: Constants.stamps),
        ],
      ),
    );
  }
}
