import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class referansPage extends StatefulWidget {
  const referansPage({Key? key}) : super(key: key);

  @override
  State<referansPage> createState() => _referansPageState();
}

class _referansPageState extends State<referansPage> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5, height: 100),
                        FloatingActionButton.small(
                          onPressed: () => Navigator.of(context).pop(),
                          tooltip: 'geri',
                          child: const Icon(Icons.arrow_back,
                              color: Colors.black38, size: 30),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    const Text(
                      'Referans Kodunuzu Alana Giriniz',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(height: 50)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 75, left: 20, right: 20, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildReferansCodeTextField(),
                    buildReferansCodeTextField(),
                    buildReferansCodeTextField(),
                    buildReferansCodeTextField(),
                    buildReferansCodeTextField(),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 248, 3, 160),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: const Text(
                    'TAMAM',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildReferansCodeTextField() {
    return const SizedBox(
      width: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
