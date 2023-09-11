import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/skeleton.dart';

class PsikologCardSkelton extends StatelessWidget {
  const PsikologCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
        height: MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Skeleton(width: MediaQuery.of(context).size.width * 0.4),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.person, color: greyColor, size: 34),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Skeleton(width: 40.0),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 25.0),
      Container(
        height: MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Skeleton(width: MediaQuery.of(context).size.width * 0.4),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.person, color: greyColor, size: 34),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Skeleton(width: 40.0),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 25.0),
      Container(
        height: MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Skeleton(width: MediaQuery.of(context).size.width * 0.4),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.person, color: greyColor, size: 34),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                  Skeleton(width: 45.0),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Skeleton(width: 40.0),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
                Skeleton(width: MediaQuery.of(context).size.width * 0.2),
              ],
            ),
          ],
        ),
      ),
      ],
    );
  }
}
