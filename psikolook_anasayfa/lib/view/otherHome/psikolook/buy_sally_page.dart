import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/payment/payment_page.dart';

class BuySallyPage extends StatefulWidget {
  final snap;
  const BuySallyPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<BuySallyPage> createState() => _BuySallyPageState();
}

class _BuySallyPageState extends State<BuySallyPage> {
  int adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor,
          ),
        ),
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
                  elevation: 0,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.pink, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 75),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Seçtiğiniz piskologunuzla ',
                    style: TextStyle(fontSize: 18)),
                Text(
                  '$adet seans',
                  style: const TextStyle(color: Colors.pink, fontSize: 18),
                ),
              ],
            ),
            const Center(
              child: Text('görüşmek için yapacağınız ödeme toplamı ',
                  style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.snap['moneyValue'] ?? 'Para değeri Girilmemiş',
                    style: const TextStyle(fontSize: 40)),
                const SizedBox(width: 20),
                const Text(' dir.', style: TextStyle(fontSize: 18))
              ],
            ),
            const SizedBox(height: 50),
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
                                  const PaymentPage(navigator: null)));
                    },
                    child: const Text(
                      'ONAYLA',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
