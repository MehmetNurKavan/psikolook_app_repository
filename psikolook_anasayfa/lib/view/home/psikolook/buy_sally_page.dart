import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'odeme_secenekleri_page.dart';

class buySallyPage extends StatefulWidget {
  const buySallyPage({super.key});

  @override
  State<buySallyPage> createState() => _buySallyPageState();
}

class _buySallyPageState extends State<buySallyPage> {
  int adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 30),
              FloatingActionButton.small(
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'geri',
                child: Icon(Icons.arrow_back_ios_new,
                    color: Colors.pink, size: 30),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 75),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seçtiğiniz piskologunuzla ',
                  style: TextStyle(fontSize: 18)),
              Text(
                '$adet seans',
                style: TextStyle(color: Colors.pink, fontSize: 18),
              ),
            ],
          ),
          Center(
            child: Text('görüşmek için yapacağınız ödeme toplamı ',
                style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('200 TL', style: TextStyle(fontSize: 40)),
              SizedBox(width: 20),
              Text(' dir.', style: TextStyle(fontSize: 18))
            ],
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const OdemeSecenekleriPage()));
                  },
                  child: Text(
                    'ONAYLA',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
