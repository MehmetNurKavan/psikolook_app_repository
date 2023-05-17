import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/ThirdPage.dart';
import 'package:psikolook_anasayfa/view/home/login/TwelfthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/eighthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/eleventhPage.dart';
import 'package:psikolook_anasayfa/view/home/login/fifthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/fourthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/ninthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/secondPage.dart';
import 'package:psikolook_anasayfa/view/home/login/seventhPage.dart';
import 'package:psikolook_anasayfa/view/home/login/sixthPage.dart';
import 'package:psikolook_anasayfa/view/home/login/tenthPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroducingPage extends StatefulWidget {
  const IntroducingPage({Key? key}) : super(key: key);

  @override
  State<IntroducingPage> createState() => _IntroducingPageState();
}

class _IntroducingPageState extends State<IntroducingPage> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              secondPage(),
              thirdPage(),
              fourthPage(),
              FifthPage(),
              SixthPage(),
              SeventhPage(),
              EighthPage(),
              NinthPage(),
              TenthPage(),
              EleventhPage(),
              TwelfthPage(),
            ],
          ),
          Container(
            alignment: Alignment(0, -0.85),
            child: SmoothPageIndicator(
              count: 11,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  color: Colors.indigo,
                  rotationAngle: 180,
                  verticalOffset: 10,
                  borderRadius: BorderRadius.circular(24),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.indigo,
                  // ),
                ),
                dotDecoration: DotDecoration(
                  width: 24,
                  height: 12,
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2),
                  //     topRight: Radius.circular(16),
                  //     bottomLeft: Radius.circular(16),
                  //     bottomRight: Radius.circular(2)),
                  borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                // activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => colors[i],
              ),
              controller: _controller,
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
];
