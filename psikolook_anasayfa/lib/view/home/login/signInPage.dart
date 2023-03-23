import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/gecici/product/common/signin_widget.dart';
import 'package:psikolook_anasayfa/gecici/services/firebase_exceptions.dart';
import 'package:psikolook_anasayfa/gecici/services/firebase_service.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/home_page/my_home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final auth = FirebaseAuthProvider();
  String email = '';
  String password = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final String _errorMessage = 'Birşeyler Ters Gitti :/';

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backGroundColor)),
        child: SingleChildScrollView(
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                SignInWidget(
                  emailChanged: (email) => this.email = email,
                  passwordChanged: (password) => this.password = password,
                  onPressed: () async {
                    try {
                      showDialog(
                        context: context,
                        builder: ((context) => const Center(
                              child: CircularProgressIndicator(),
                            )),
                      );
                      await auth.logIn(
                        email: email,
                        password: password,
                      );

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homePage(),
                          ),
                          (route) => false);
                    } on UserNotFoundAuthException {
                      await fireShowDialog(
                        context,
                        title: 'Kullancı Bulunamadı.',
                        content: 'Email ve Şifrenizi Konrol Ediniz',
                      );
                    } on WrongPasswordAuthException {
                      await fireShowDialog(
                        context,
                        title: 'Yanlış Şifre',
                        content: 'Email ve Şifrenizi Konrol Ediniz',
                      );
                    } on GenericAuthException {
                      await fireShowDialog(
                        context,
                        title: 'Hata!',
                        content: _errorMessage,
                      );
                    }
                  },
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*   void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => homePage()),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata!"),
                content: Text(result!),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Geri Dön",style: TextStyle(color: Colors.pink)))
                ],
              );
            });
      }
    }
  } */
}
 
// ignore_for_file: use_build_context_synchronously

/* import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/gecici/constant/colors.dart';
import 'package:psikolook_anasayfa/view/home/gecici/constant/constants.dart';
import 'package:psikolook_anasayfa/view/home/gecici/product/common/animated_texts.dart';
import 'package:psikolook_anasayfa/view/home/gecici/product/common/bottom_widget.dart';
import 'package:psikolook_anasayfa/view/home/gecici/product/common/show_dialog.dart';
import 'package:psikolook_anasayfa/view/home/gecici/services/firebase_exceptions.dart';
import 'package:psikolook_anasayfa/view/home/gecici/services/firebase_service.dart';
import 'package:psikolook_anasayfa/view/home/login/chat_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final auth = FirebaseAuthProvider();
  String email = '';
  String password = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final String _errorMessage = 'Something Bad Happened :/';

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProductColors.registerContainerColor,
      ),
      backgroundColor: ProductColors.scaffoldColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ProductColors.registerContainerColor,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  AnimatedTextWidget(),
                  // Maybe we can add a logo here or something else to make it more beautiful
                ],
              ),
            ),
          ),
          BottomWidget(
            emailChanged: (email) => this.email = email,
            passwordChanged: (password) => this.password = password,
            heroTag: 'login',
            onPressed: () async {
              try {
                showDialog(
                  context: context,
                  builder: ((context) => const Center(
                        child: CircularProgressIndicator(),
                      )),
                );
                await auth.logIn(
                  email: email,
                  password: password,
                );

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                    (route) => false);
              } on UserNotFoundAuthException {
                await fireShowDialog(
                  title: 'User Not Found',
                  context,
                  content: 'Check Your Email and Password',
                );
              } on WrongPasswordAuthException {
                await fireShowDialog(
                  title: 'Wrong Password',
                  context,
                  content: 'Check Your Email or Password',
                );
              } on GenericAuthException {
                await fireShowDialog(
                  title: 'Error',
                  context,
                  content: _errorMessage,
                );
              }
            },
            buttonText: Constants.logInText,
            emailController: _emailController,
            passwordController: _passwordController,
          )
        ],
      ),
    );
  }
}
 */