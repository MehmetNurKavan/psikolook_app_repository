import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/login/ThirdPage.dart';
import 'package:psikolook_anasayfa/view/partner/login/fifthPage.dart';
import 'package:psikolook_anasayfa/view/partner/login/fourthPage.dart';
import 'package:psikolook_anasayfa/view/partner/login/secondPage.dart';
import 'package:psikolook_anasayfa/view/partner/login/sixth_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroducingPage extends StatefulWidget {
  const IntroducingPage({Key? key}) : super(key: key);

  @override
  State<IntroducingPage> createState() => _IntroducingPageState();
}

class _IntroducingPageState extends State<IntroducingPage> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              SecondPage(),
              ThirdPage(),
              FourthPage(),
              FifthPage(),
              SixthPage(),
              /*
              //bi tanesixthpage daha vardı dikat et 
              SeventhPage(),
              EighthPage(),
              NinthPage(),
              TenthPage(),
              EleventhPage(),
              TwelfthPage(), 
              LoginHomePage(),*/
            ],
          ),
          Container(
            alignment: const Alignment(0, -0.85),
            child: SmoothPageIndicator(
              count: 5, //!önemli
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  /* color: Colors.indigo, */
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
                activeColorOverride: (i) => colorsLogin[i],
                inActiveColorOverride: (i) => colorsLogin[i],
              ),
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
