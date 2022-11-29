import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OdemeSecenekleriPage extends StatefulWidget {
  const OdemeSecenekleriPage({super.key});

  @override
  State<OdemeSecenekleriPage> createState() => _OdemeSecenekleriPageState();
}

class _OdemeSecenekleriPageState extends State<OdemeSecenekleriPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 215, 226),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 30),
                FloatingActionButton.small(
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'geri',
                  child: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.pink, size: 30),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 75),
            const Text(
              'Ödeme Seçenekleri',
              style: TextStyle(color: Colors.pink, fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kredi Kartı - BankaKartı',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
              child: TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                maxLength: 50,
                maxLines: 1,
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);
                  }
                },
                onSubmitted: (String deger) {
                  print("submit " + deger);
                },
                cursorColor: Colors.pink,
                decoration: const InputDecoration(
                  labelText: 'Ad Soyad',

                  // hintText: 'Ad Soyad',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLength: 16,
                maxLines: 1,
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);
                  }
                },
                onSubmitted: (String deger) {
                  print("submit " + deger);
                },
                cursorColor: Colors.pink,
                decoration: const InputDecoration(
                  labelText: 'Kart Numarası',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                    //  borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 150,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 2,
                      maxLines: 1,
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: 'Ay',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 4,
                      maxLines: 1,
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: 'Yıl',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                const SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 3,
                    maxLines: 1,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Image.asset('assets/images/gecici.png')),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sözleşmeyi ',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Text('okudum onaylıyorum'),
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    checkColor: Colors.pink,
                    activeColor: Colors.pink,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: 250,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ödemeyi ONAYLA',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
