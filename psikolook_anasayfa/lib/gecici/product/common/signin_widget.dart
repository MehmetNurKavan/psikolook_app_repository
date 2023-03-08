import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/widget/textfield_widget.dart';
import 'package:psikolook_anasayfa/widget/textfiiedpassword_widget.dart';
import 'package:psikolook_anasayfa/view/home/login/ForgetPasswordPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signInWithPhonePage.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed,
    this.emailChanged,
    this.passwordChanged,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final void Function()? onPressed;
  final Function(String)? emailChanged;
  final Function(String)? passwordChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("E-Posta:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          controller: _emailController,
          hintText: 'E-Posta Adresinizi Giriniz',
          onChanged: emailChanged,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Şifre:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldPasswordWidget(
          onChanged: passwordChanged,
          controller: _passwordController,
          hintText: 'Şifreniz',
          isPassword: true,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.transparent.withOpacity(0),
                shadowColor: Colors.transparent.withOpacity(0),
                foregroundColor: Colors.transparent.withOpacity(0)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInWithPhonePage()));
            },
            child: const Text(
              "Telefon Numarasıyla Giriş Yap",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  onPressed: onPressed,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 13, bottom: 13),
                    child: Text("Giriş Yap"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordPage()));
                    },
                    child: const Text("Şifremi Unuttum",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400))),
              ],
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Image.asset("assets/images/logo_kucuk.png"),
      ],
    );
  }
}
