import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';
import 'package:psikolook_anasayfa/utils/customTextStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 215, 226),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backIconButton(),
            SizedBox(
              height: 109,
            ),
            passwordText(),
            passwordField(),
            SizedBox(
              height: 61,
            ),
            loginButton()
          ],
        ));
  }

  Row loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 33.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Giriş Yap",
              style: TextStyle(fontSize: 30),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(CustomColors.loginButtonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
          ),
        ),
      ],
    );
  }

  Padding passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33.0),
      child: Container(
          height: 52,
          width: 352,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: Colors.white),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_sharp)),
                    hintText: "Şifrenzi Giriniz",
                    hintStyle: textStyle.textFieldHintStyle),
              ),
            ),
          )),
    );
  }

  Padding passwordText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0, left: 41),
      child: Text("Şifreniz", style: textStyle.homepageTextStyle),
    );
  }

  Padding backIconButton() {
    return Padding(
      padding: EdgeInsets.only(left: 33, top: 72),
      child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19), color: Colors.white),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: CustomColors.backIconColor,
                )),
          )),
    );
  }
}
