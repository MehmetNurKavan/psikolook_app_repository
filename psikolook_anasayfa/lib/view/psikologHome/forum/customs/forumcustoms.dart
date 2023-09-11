import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaddingCustom extends StatelessWidget {
  Widget child;
  PaddingCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 20.0, left: 20.0),
      child: child,
    );
  }
}

class AddButton extends StatelessWidget {
  final Function()? func;
  const AddButton({Key? key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.only(
                right: 40.0, left: 40.0, top: 7.5, bottom: 7.5),
            backgroundColor: Colors.black),
        onPressed: () => func,
        child: const Text(
          "EKLE",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class CustomForumCard extends StatelessWidget {
  const CustomForumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(padding: const EdgeInsets.all(15.0)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 36,
            child: CircleAvatar(
              radius: 32,
              foregroundImage: AssetImage(
                "assets/images/woman_blog.png",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
