import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  String name = 'Klinik Psikolog Alperen';
  String baslik = 'Obsesif Kompulsif Bozukluk';
  int readTime = 10;
  String blogText =
      'Obsesif kompulsif bozukluk (OKB); belirgin bir gerginliğe neden olup işlevselliği önemli ölçüde etkileyen, yineleyici düşünce dürtü ve düşlemler olarak tanımlanabilen obsesyonlar ve bireyin bu obsesyonlara yanıt olarak ortaya koyduğu çoğu zaman oluşan kaygıyı azaltmayı amaçlayan yada korkulan sonu engellemek için yapılandavranışlar  kompulsiyonlar) ve zihinsel eylemleri kapsayan bir psikiyatrik bozukluktur. 1-2 Obsesyonlar tekrarlayıcı ve zorlayıcı şekilde beliren, kişide streseneden olan inatçı fikir, imaj, dürtü yada düşüncelerdir.3 Kompulsiyon genellikleobsesyonla ilişkili anksiyetenin giderilmesi için bireyin saçma olduğunu bildiği haldtekrarlayıp belli ritüeller şeklinde yaptığı davranışlar, fikirler yada eylemlerdir.3-4Bunlar huzursuzluk duygusunun ve yoğun anksiyetenin ortadan kalkması ve “şimdioldu” düşüncesi belirene kadar tekrarlanabilmektedir.5 Okb genellikle süreğen, dönemsel alevlenmelerle ilerleyen ve tedavi edilmezse kişinin günlük hayatişlevselliğinde belirgin bozulmalara yol açan bir hastalıktır.6-7 Dünya sağlık örgütü0verilerine göre Obsesif Kompulsif bozukluk işlevselliği negatif yönde etkileyen fiziksel....';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.close,
          size: 40,
          shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 40.0)],
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 235, 240),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 254, 248),
              Color.fromARGB(255, 255, 254, 248),
            ],
          )),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    child: Image.asset(
                  'assets/images/woman_blog.png',
                  fit: BoxFit.cover,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, bottom: 35.0, left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Yazan: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5CE1E6),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            name,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              baslik,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          '$readTime dkk',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black45,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      blogText,
                      style:
                          const TextStyle(fontSize: 22, color: Colors.black54),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
