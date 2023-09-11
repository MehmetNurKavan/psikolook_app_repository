import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/login/Login_home.dart';

class OnayBeklemeEkrani extends StatelessWidget {
  const OnayBeklemeEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginHomePage()),
              (route) => false),
        ),
        title: const Text('Psikolook', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backGroundColor)),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
                'Bilgileriniz başarıyla kaydedildi. Lütfen profilinizin onaylanılmasını bekleyiniz. Bu biraz zaman alacaktır. Psikologlarımız sizin bilgilerinizi inceleyip onaylanıldığı takdirde size e-posta ile bildirilecektir.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21)),
          ),
        ),
      ),
    );
  }
}
