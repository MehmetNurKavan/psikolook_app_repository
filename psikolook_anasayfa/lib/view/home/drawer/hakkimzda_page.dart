import 'package:flutter/material.dart';

class HakkimizdaPage extends StatelessWidget {
  const HakkimizdaPage({super.key});

  @override
  Widget build(BuildContext context) {
    String hakkimizdaText =
        'Bizler,  psikolojik desteğe ulaşmanın önündeki engelleri kaldırmak ve insanlarda  kendilik farkındalığı oluşturmak amacıyla çalışmalar yapan bir grup üniversite öğrencisiyiz. Bu platformu kurmaktaki en büyük motivasyonumuz toplumsal fayda sağlamak ve kalplere dokunabilmektir. Çabamızı deniz yıldızı hikayesine benzetiyoruz. Bu hikayede sahilde yürüyen bir adam bir çocuğun kıyı boyunca uzanmış denizyıldızlarını tek tek denize fırlatmaya çalıştığını görür. Fakat adam çocuğa kıyıda  binlerce deniz yıldızı olduğunu, suya birkaç deniz yıldızı fırlatmanın bir şey değiştirmeyeceğini söylediğinde çocuk son attığı deniz yıldızını göstererek "Ama onun için çok şey değişti," der.  Bizler de psikolojik destek almakta zorluk yaşayan bir kişiye bile yardımcı olmanın, o kişinin hayatında çok şey değiştirebileceğine inanıyoruz. Tüm denizyıldızlarına yardım edebilmek ümidiyle...';
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 234, 240),
              Color.fromARGB(255, 255, 244, 244),
              Color.fromARGB(255, 255, 254, 248),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 70),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    FloatingActionButton.small(
                      onPressed: () => Navigator.pop(context),
                      tooltip: 'Geri',
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Center(
                      child: Text(
                        'HAKKIMIZDA',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          //altındaki çizgiyi kaldırdı
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        hakkimizdaText,
                        style: TextStyle(fontSize: 20, color: Colors.black45),
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
