import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:psikolook_anasayfa/view/adminHome/admin_panel.dart';
import 'package:psikolook_anasayfa/utils/psikolook_loading.dart';
import 'package:psikolook_anasayfa/view/otherHome/home_page/my_home_page.dart';
import 'package:psikolook_anasayfa/view/partner/login/firstPage.dart';
import 'package:psikolook_anasayfa/view/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'firebase_options.dart';
import 'package:psikolook_anasayfa/users/diferent_user_platform.dart';
import 'package:flutter/services.dart';

//Psikolook
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Psikolook',
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr', 'TR'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('tr', 'TR')],
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const DiferentPlatformLayout(
                psikologUserScreen: PsikologHome(),
                otherUserScreen: HomePage(),
                adminUserScreen: AdminPanel(),
              );
            } else {
              return const FirstPage();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const PsikolookLoading();
          } else {
            return const FirstPage();
          }
        },
      ),
    );
  }
}
