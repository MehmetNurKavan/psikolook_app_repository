import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/skeleton.dart';

class PostCardSkelton extends StatelessWidget {
  const PostCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [ 
        Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.person, color: greyColor, size: 34),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Skeleton(width: 75.0),
                      SizedBox(height: 10.0),
                      Skeleton(width: 100.0),
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
            ),
            Skeleton(width: MediaQuery.of(context).size.width * 0.5),
            const SizedBox(height: 50),
          ],
        ),
      ),
      const SizedBox(width: 10.0),
      Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(39)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.person, color: Colors.grey, size: 34),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Skeleton(width: 75.0),
                      SizedBox(height: 10.0),
                      Skeleton(width: 100.0),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_down_sharp))
                ],
              ),
            ),
            Skeleton(width: MediaQuery.of(context).size.width * 0.8),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
      ],
    );
  }
}
