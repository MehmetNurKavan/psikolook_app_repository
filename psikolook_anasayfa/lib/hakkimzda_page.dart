import 'package:flutter/material.dart';

class HakkimizdaPage extends StatelessWidget {
  const HakkimizdaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.pink[100],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    FloatingActionButton.small(
                      onPressed: () => Navigator.pop(context),
                      tooltip: 'Geri',
                      backgroundColor: Colors.white,
                      elevation: 0,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Center(
                      child: Text(
                        'HAKKIMIZDA',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          //altındaki çizgiyi kaldırdı
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'Bizler,  psikolojik desteğe ulaşmanın önündeki engelleri kaldırmak ve insanlarda  kendilik farkındalığı oluşturmak amacıyla çalışmalar yapan bir grup üniversite öğrencisiyiz. Bu platformu kurmaktaki en büyük motivasyonumuz toplumsal fayda sağlamak ve kalplere dokunabilmektir. Çabamızı deniz yıldızı hikayesine benzetiyoruz. Bu hikayede sahilde yürüyen bir adam bir çocuğun kıyı boyunca uzanmış denizyıldızlarını tek tek denize fırlatmaya çalıştığını görür. Fakat adam çocuğa kıyıda  binlerce deniz yıldızı olduğunu, suya birkaç deniz yıldızı fırlatmanın bir şey değiştirmeyeceğini söylediğinde çocuk son attığı deniz yıldızını göstererek "Ama onun için çok şey değişti," der.  Bizler de psikolojik destek almakta zorluk yaşayan bir kişiye bile yardımcı olmanın, o kişinin hayatında çok şey değiştirebileceğine inanıyoruz. Tüm denizyıldızlarına yardım edebilmek ümidiyle...',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Column(
              children: [
                Container(
                  height: 125.0,
                  width: 125.0,
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/starfish.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
