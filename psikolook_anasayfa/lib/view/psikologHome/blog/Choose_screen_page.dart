import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/my_blogs_page%20.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/my_posts_page.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backIconButton(),
            const SizedBox(height: 60),
            chooseElevatedButton("Blog Yazısı Yaz", MyBlogsPage(uid: FirebaseAuth.instance.currentUser!.uid)),
            const SizedBox(
              height: 46,
            ),
            chooseElevatedButton(
                "Paylaşım Yap",
                MyPostsPage(
                  uid: FirebaseAuth.instance.currentUser!.uid
                )),
                const SizedBox(
              height: 46,
            ),
          ],
        ),
      ),
    );
  }

//"Blog Yazısı Yaz" ve "Paylaşım Yap" buttonları....
  Center chooseElevatedButton(String elevatedButtonText, pageClassName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: SizedBox(
            height: 123,
            width: 304,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageClassName,
                        ));
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.customElevatedButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)))),
                  child: Text(elevatedButtonText,
                      style: textStyle.chooseElevatedButtonStyle)),
            )),
      ),
    );
  }

// IconButton önceki sayfaya döndüren...
  Padding backIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 72),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          )),
    );
  }
}
