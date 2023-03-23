import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone, {Key? key}) : super(key: key);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 76,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(18.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backGroundColor,
                ),
                ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                      children: [
                        const SizedBox(width: 5, height: 150),
                        FloatingActionButton.small(
                            elevation: 0,
                            backgroundColor: Colors.black,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    '+90-${widget.phone}',
                    style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 26),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 75, left: 20, right: 20, bottom: 50),
                child: Column(
                  children: [
                    const Text(
                      "Telefon numaranıza gelen kodu giriniz:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      controller: _pinPutController,
                      pinAnimationType: PinAnimationType.fade,
                      onSubmitted: (pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                                  verificationId: _verificationCode!, smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const psikolog_page()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+90${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const psikolog_page()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
