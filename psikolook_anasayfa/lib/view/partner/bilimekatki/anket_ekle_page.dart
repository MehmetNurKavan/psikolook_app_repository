import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/widget/back_button.dart';

class AnketEklePage extends StatefulWidget {
  const AnketEklePage({Key? key}) : super(key: key);

  @override
  State<AnketEklePage> createState() => _AnketEklePageState();
}

class _AnketEklePageState extends State<AnketEklePage> {
  bool isLoading = false;
  final TextEditingController _surveyTitleController = TextEditingController();
  final TextEditingController _surveyNameController = TextEditingController();
  final TextEditingController _surveyLinkController = TextEditingController();

  void addSurvay(
    String uid,
    String survayTitle,
    String survayName,
    String survayLink,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      if (uid != '' && survayTitle != '' && survayName != '') {
        String res = await FireStoreMethods().uploadNewSurvey(
          uid,
          survayTitle,
          survayName,
          survayLink,
        );
        if (res == "success") {
          setState(() {
            isLoading = false;
          });
          showSnackBar(
            context,
            'Yeni Anket Yayınlanıldı!',
          );
          Navigator.of(context).pop();
        } else {
          showSnackBar(context, res);
        }
      } else {
        showSnackBar(context, 'Lütfen tüm değerleri giriniz!');
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  void dispose() {
    _surveyTitleController.dispose();
    _surveyNameController.dispose();
    _surveyLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Card(
              elevation: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackIconButton(),
                      const Expanded(
                        child: Center(
                          child: Text('Anket Ekle',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Anket Adı:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: TextField(
                                controller: _surveyTitleController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        const Text('Anketi Yapan Kişinin Adı Soyadı:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextField(
                          controller: _surveyNameController,
                        ),
                        const SizedBox(height: 30.0),
                        const Text('Anket Linki:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextField(
                          controller: _surveyLinkController,
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  side: const BorderSide(
                                      width: 0.7, color: greyColor)),
                              onPressed: () => addSurvay(
                                FirebaseAuth.instance.currentUser!.uid,
                                _surveyTitleController.text.trim(),
                                _surveyNameController.text.trim(),
                                _surveyLinkController.text.trim(),
                              ),
                              child: const Text('Anketi Yayınla',
                                  style: TextStyle(color: Colors.black87)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
