import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/constant/colors.dart';

class Constants {
  //-------------STRINGS----------------

  // static const String splashImg = 'assets/images/backgroun1.png';
  // static const String registerMessage = 'One step away from ';
  // static const String enterPassword = 'Şifrenizi Giriniz';
  //static const String forgotPassword = 'Şifrenizi mi unuttunuz ?';
  static const String typeMessage = 'Birşeyler yazınız...';

  // ---------------RADIUS&PADDING----------------

  static const buttonPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );
  static const bubblePadding = EdgeInsets.symmetric(
    vertical: 15,
    horizontal: 20,
  );

  static const Radius radius = Radius.circular(20);
  static const BorderRadius registerRadius = BorderRadius.only(
    topLeft: Radius.circular(60),
    topRight: Radius.circular(60),
    bottomLeft: Radius.circular(60),
    bottomRight: Radius.circular(60),
  );
  static const EdgeInsets textFieldPadding =
      EdgeInsets.symmetric(horizontal: 30);
  static const BorderRadius textFieldRadius =
      BorderRadius.all(Radius.circular(12));
  static const chatBubbleRadius = EdgeInsets.symmetric(
    horizontal: 0,
    vertical: 20,
  );
  static const myChatBubbleRadius = BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );
  static const otherChatBubbleRadius = BorderRadius.only(
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );

  // -----------------STYLES----------------

  static const TextStyle coloredTextStyle = TextStyle(
    fontSize: 70.0,
    fontWeight: FontWeight.bold,
  );
  static const stamps = TextStyle(
    fontSize: 12,
    color: ProductColors.regularWhite,
  );
  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: ProductColors.buttonColor,
    padding: Constants.buttonPadding,
    side: const BorderSide(color: Colors.white),
  );
}
