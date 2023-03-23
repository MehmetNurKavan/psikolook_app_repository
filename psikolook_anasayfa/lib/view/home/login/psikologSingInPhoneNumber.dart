/* import 'package:country_picker/country_picker.dart'; */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/login/otp.dart';
/* import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/providers/auth_provider.dart'; */
import 'PsikologForgetPassword.dart';
import 'PsikologsingInPage.dart';

class PsikologSignInWithPhonePage extends StatefulWidget {
  const PsikologSignInWithPhonePage({Key? key}) : super(key: key);

  @override
  State<PsikologSignInWithPhonePage> createState() =>
      _PsikologSignInWithPhonePageState();
}

class _PsikologSignInWithPhonePageState
    extends State<PsikologSignInWithPhonePage> {
/*   final controller = Get.put(SignUpController()); */
  /* Country selectedCountry = Country(
    phoneCode: "90",
    countryCode: "TR",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Turkey",
    example: "Turkey",
    displayName: "Turkey",
    displayNameNoCountryCode: "TR",
    e164Key: "",
  ); */
  final _phoneController = TextEditingController();
  /*  final _codeController = TextEditingController(); */

  /* Future<bool?> loginUser(String phone, BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await auth.signInWithCredential(credential);
          User user = result.user!;
          if (user != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const psikolog_page()));
          } else {
            print("Error");
          }
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text("Confirm"),
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);
                        UserCredential result =
                            await auth.signInWithCredential(credential);
                        User user = result.user!;
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const psikolog_page()));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  } */

  void _verifyPhoneNumber() async {
    String? _message;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      showSnackBar(
        context,
        'Doğrulama kodu için lütfen telefonunuzu kontrol edin.',
      );
      _verificationId:
      verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verificationId:
      verificationId;
    };

    await auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(),
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  final _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;

  @override
  Widget build(BuildContext context) {
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _phoneController.text.length,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 253, 215, 226),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backGroundColor)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, left: 15, right: 15.0, bottom: 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Telefon:",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: TextFormField(
                        controller: _phoneController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+90'),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Telefon Numaranız",
                          filled: true,
                          fillColor: Colors.white,
                          /* prefixIcon: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    countryListTheme:
                                        const CountryListThemeData(
                                      bottomSheetHeight: 550,
                                    ),
                                    onSelect: (value) {
                                      setState(() {
                                        selectedCountry = value;
                                      });
                                    });
                              },
                              child: Text(
                                "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ), */
                          /* suffixIcon: phoneController.text.length > 9
                              ? Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : null,*/
                        ),
                        /*  onChanged: (value) {
                          setState(() {
                            phoneController.text = value;
                          });
                        }, */
                      ),
                    ),
                  ],
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Şifre:",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ), */
                /* Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: TextField(
                        controller: controller.password,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText1 = !_obscureText1;
                                  });
                                },
                                color: Colors.black,
                                icon: Icon(_obscureText1
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintText: "Şifreniz",
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                  ],
                ), */
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent.withOpacity(0),
                        shadowColor: Colors.transparent.withOpacity(0),
                        foregroundColor: Colors.transparent.withOpacity(0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PsikologSignInPage()));
                    },
                    child: const Text(
                      "E-Mail ile Giriş Yap",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPScreen(_phoneController.text)));
                            /* sendPhoneNumber(); */
                            /* final phone = _phoneController.text.trim();
                            loginUser(phone, context); */
                            /* _verifyPhoneNumber(); */
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 13, bottom: 13),
                            child: Text("Giriş Yap"),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PsikologForgetPasswordPage()));
                            },
                            child: const Text("Şifremi Unuttum",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400))),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Image.asset("assets/images/logo_kucuk.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  } */
}
