import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/skeleton.dart';

class MeetCardSkelton extends StatelessWidget {
  const MeetCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.95,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Skeleton(width: MediaQuery.of(context).size.width * 0.7),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.person, color: greyColor, size: 34),
                const SizedBox(width: 50.0),
                Column(
                  children: const [
                    Skeleton(width: 100),
                    SizedBox(height: 10.0),
                    Skeleton(width: 75),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right:15.0),
                child: Skeleton(width: MediaQuery.of(context).size.width * 0.4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
