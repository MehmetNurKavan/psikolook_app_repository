import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';

class SnapPage extends StatefulWidget {
  const SnapPage({super.key});

  @override
  State<SnapPage> createState() => _SnapPageState();
}

class _SnapPageState extends State<SnapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Column(
        children: [
          SizedBox(
            height: 81.7,
          ),
          barField(),
          SizedBox(
            height: 81.7,
          ),
          snapCardField(),
          SizedBox(
            height: 24,
          ),
          hearthIcon(),
        ],
      ),
    );
  }

// yana dogru kayan kartları içeriyor...
  Padding snapCardField() {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              shareCard(),
              SizedBox(
                width: 18,
              ),
              shareCard(),
              SizedBox(
                width: 18,
              ),
              shareCard(),
            ],
          )),
    );
  }

//close icon içeriyor
  Row barField() {
    return Row(
      children: [
        closeIconButton(),
      ],
    );
  }

  Container shareCard() {
    return Container(
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(39)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.person, color: CustomColors.hearthColor, size: 34),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Psikolook",
                      style: textStyle.userNameTextStyle,
                    ),
                    Text(
                      "1 hours ago",
                      style: textStyle.onlineTextStyle,
                    )
                  ],
                ),
                SizedBox(width: 120),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down_sharp))
              ],
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            "Henüz hiç paylaşımın yok,\nhadi paylaşım yaparak kalplere dokun",
            style: textStyle.cardTextStyle,
          ),
        ],
      ),
    );
  }

  Container hearthIcon() {
    return Container(
      height: 71,
      width: 71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5), color: Colors.white),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/heart.png'),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.closeIconButtonColor),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: Colors.white,
            iconSize: 22,
          )),
    );
  }
}
