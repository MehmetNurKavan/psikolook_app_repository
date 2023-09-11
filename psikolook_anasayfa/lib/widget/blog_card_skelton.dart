import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/widget/skeleton.dart';

class BlogCardSkelton extends StatelessWidget {
  const BlogCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: 10.0),
        Container(
          height: 125,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(width: 45.0, height: 15.0),
              SizedBox(height: 10.0),
              Skeleton(width: 30.0, height: 10.0),
            ],
          )),
        ),
        const SizedBox(width: 10.0),
        Container(
          height: 125,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(width: 45.0, height: 15.0),
              SizedBox(height: 10.0),
              Skeleton(width: 30.0, height: 10.0),
            ],
          )),
        ),
        const SizedBox(width: 10.0),
        Container(
          height: 125,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(width: 45.0, height: 15.0),
              SizedBox(height: 10.0),
              Skeleton(width: 30.0, height: 10.0),
            ],
          )),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
