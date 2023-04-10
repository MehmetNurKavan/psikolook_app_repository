import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/constant/constants.dart';
import 'dart:math' as math show Random;

class MessageBubble extends StatefulWidget {
  const MessageBubble({
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
  List colors = [const Color(0xFFA2CED9), Color(0xFFEED0DD), Color(0xFFD5CDED)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment:
            widget.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 10,
            shadowColor: Colors.white24,
            borderRadius: widget.isMe!
                ? Constants.myChatBubbleRadius
                : Constants.otherChatBubbleRadius,
            color: widget.isMe!
                ? const Color.fromARGB(254, 251, 245, 236)
                : colors[math.Random().nextInt(colors.length)],
            child: Padding(
              padding: Constants.bubblePadding,
              child: Text(
                widget.text!,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.isMe! ? Colors.black54 : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: widget.isMe!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Text(widget.sender!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    )),
                const SizedBox(width: 11),
                Text(
                    DateFormat('dd.MM / kk:mm')
                        .format(widget.timestamp!.toDate()),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
