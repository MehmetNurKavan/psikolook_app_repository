import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/home/login/ForgetPasswordPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signInWithPhonePage.dart';
import 'package:psikolook_anasayfa/widget/text_field_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;
 
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    showLoaderDialog(context);
    setState(() {
      _isLoading = true;
    });
    String res = await OtherAuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: backGroundColor)),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 15, right: 15.0, bottom: 0.0),
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
                      children: const[
                        SizedBox(
                          width: 10.0,
                        ),
                        Text("E-Mail:",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: /* TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: "E-Mail Adresiniz",
                              filled: true,
                              fillColor: Colors.white),
                        ), */
                              TextFieldInput(
                            hintText: 'E-Mail Adresiniz',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _emailController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const[
                        SizedBox(
                          width: 10.0,
                        ),
                        Text("Şifre:",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  color: Colors.black,
                                  icon:
                                      Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              hintText: "Şifrenizi Giriniz",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        ),
                      ],
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
                                  builder: (context) =>
                                      const SignInWithPhonePage()));
                        },
                        child: const Text(
                          "Telefon Numarasıyla Giriş Yap",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /* !_isLoading
                            ? Container()
                            : const CircularProgressIndicator(), */
                        const SizedBox(width: 50),
                        Column(
                          children: [
                            /* InkWell(
                            child: Container(
                              child: !_isLoading
                                  ? const Text(
                                      'Giriş Yap',
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                color: Colors.black,
                              ),
                            ),
                            onTap: loginUser,
                          ), */
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                textStyle: const TextStyle(fontSize: 24),
                              ),
                              onPressed: loginUser,
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
                                              const ForgetPasswordPage()));
                                },
                                child: const Text("Şifremi Unuttum",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400))),
                          ],
                        ),
                      ],
                    ),
                    //SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Image.asset("assets/images/logo_kucuk.png"),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
