import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikolook_anasayfa/constant/constants.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({
    Key? key,
    this.text,
    this.sender,
    this.isMe,
    this.timestamp,
    this.nickname,
    this.color,
  }) : super(key: key);

  final String? text;
  final String? sender;
  final bool? isMe;
  final Timestamp? timestamp;
  final String? nickname;
  final Color? color;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isMe!
          ? const EdgeInsets.only(top: 15.0, left: 70.0)
          : const EdgeInsets.only(top: 15.0, right: 70.0),
      child: Column(
        crossAxisAlignment:
            widget.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 1.5, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: widget.isMe!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                widget.isMe!
                    ? Container()
                    : CircleAvatar(
                        radius: 7.5,
                        backgroundColor:
                            widget.isMe! ? Colors.black87 : widget.color,
                      ),
                widget.isMe! ? Container() : const SizedBox(width: 5.0),
                Text(widget.nickname!,
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.isMe! ? Colors.black : widget.color,
                    )),
                widget.isMe! ? const SizedBox(width: 5.0) : Container(),
                widget.isMe!
                    ? CircleAvatar(
                        radius: 7.5,
                        backgroundColor:
                            widget.isMe! ? Colors.black26 : widget.color,
                      )
                    : Container(),
              ],
            ),
          ),
          Material(
            elevation: 10,
            shadowColor: Colors.white24,
            borderRadius: widget.isMe!
                ? Constants.myChatBubbleRadius
                : Constants.otherChatBubbleRadius,
            color: widget.isMe! ? messageBubleBlueColor : cardBackgroundColor,
            child: Padding(
              padding: Constants.bubblePadding,
              child: Column(
                children: [
                  Text(
                    widget.text!,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.isMe! ? Colors.black : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.5, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: widget.isMe!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Text(DateFormat('dd.MM / ').format(widget.timestamp!.toDate()),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black45,
                    )),
                Text(DateFormat('kk:mm').format(widget.timestamp!.toDate()),
                    style: const TextStyle(
                      fontSize: 13,
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
