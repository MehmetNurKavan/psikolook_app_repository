import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class UserContrat extends StatefulWidget {
  const UserContrat({Key? key}) : super(key: key);

  @override
  State<UserContrat> createState() => _UserContratState();
}

class _UserContratState extends State<UserContrat> {
  bool userContract = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30, left: 20.0, right: 20.0, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => Navigator.pop(context, userContract),
                      tooltip: 'geri',
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 30),
                    ),
                    const Text(
                      'Lütfen kaydırınız',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Kullanım Sözleşmesi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                            'PSİKOLOOK KULLANIM SÖZLEŞMESİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                              '1.1 İşbu Kullanım Sözlemesi’ne “Sözleşme” taraf olan ve Platform uygulamasında bulunan içeriği kullanmak üzere üye olan gerçek veya tüzel kişiler “Danışan” olarak, Danışanların yardıma ihtiyaç duyduğu alanlardaki uzman veya klinik psikologlar “Danışman” olarak anılacaktır. Her ikisi birlikte ise “Taraflar” olarak anılacaktır.'),
                          Text(''),
                          Text(
                            '1.2 Danışan ve Danışman tek tek ise “Taraf”, birlikte ise “Taraflar” olarak anılacaktır.',
                          ),
                          Text(''),
                          Text(
                              '1.3 Tarafları biraraya getirmek için çevrimiçi hizmet sunan Psikolook ise işbu Sözleşme’de taraf sıfatı taşımamaktadır.'),
                          Text(''),
                          Text(
                            '2. TANIMLAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                            '2.1 Psikolook ve/veya Platform: Psikolook, internet üzerinden danışmanla danışanı bir araya getirmek suretiyle, internet sitesi ve/veya mobil uygulama ile aracılığıyla sunulan çevrimiçi aracılık hizmetini ifade etmektedir.',
                          ),
                          Text(''),
                          Text(
                              '2.2 Danışan: Psikolook uygulamasında hesap oluşturarak Danışman tarafından sunulacak çevrimiçi psikolojik danışmanlık hizmetlerinden faydalanma isteğini beyan etmiş kişilerdir.'),
                          Text(''),
                          Text(
                            '2.3 Danışman: Psikolook uygulamasında ve/veya Platform üzerinden danışmanlara özel profil bilgilerini doldurmuş ve uzmanlığını sunduğu resmi belgeler (sertifika, diploma vb.) ile belgelemiş olan ve Psikolook uygulaması aracılığıyla çevrimiçi ortamda biraraya geleceği Danışan’lara çevrimiçi danışmanlık hizmeti vermek istediğini beyan etmiş kişilerdir.',
                          ),
                          Text(''),
                          Text(
                              '2.4 Danışmanlık Hizmeti: Danışman ile Danışan’ın Psikolook uygulaması aracılığıyla bir araya gelmesi suretiyle sunulacak olan çevrimiçi psikolojik danışmanlık hizmetini ifade etmektedir.'),
                          Text(''),
                          Text(
                            '2.5 Üyelik Şartları: Detayları Sözleşme’nin 8. Maddesinde belirlenen ve Danışan’ın Platform’a üye olarak uygulamadan faydalanabilmesi için taşıması gereken şartları ifade etmektedir.',
                          ),
                          Text(''),
                          Text(
                            '3. KONU VE AMAÇ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                            '3.1 İşbu Sözleşme Danışan ve Danışman arasında kurulacak olan psikolojik danışmanlık şeklindeki hizmet ilişkisine dair şartlar ile Psikolook’un sunacağı Platform aracılık hizmetine dair detayların belirlenmesi amacıyla hazırlanmıştır.',
                          ),
                          Text(''),
                          Text(
                            '4. SÖZLEŞME SÜRE VE KAPSAMI',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '4.1 İşbu Sözleşme Danışan’ın Platform’a üye olarak kullanımına başlanmasıyla birlikte uygulanmaya başlar ve kullanıma devam edildiği müddetçe geçerli hukuki yapıyı oluşturur.'),
                          Text(''),
                          Text(
                              '4.2 Danışan’ın hesabının kapanması/kapatılmasıyla birlikte Sözleşme sona erer.'),
                          Text(''),
                          Text(
                            '5. GENEL HÜKÜMLER',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '5.1 Platform, zamansal, mekânsal yahut sair sebeplerle yüzyüze psikolojik danışmanlık hizmeti alamayan Danışanlar ile platform hizmetlerinden faydalanarak psikolojik danışmanlık hizmeti vermek isteyen Danışmanlar’ı çevrimiçi olarak buluşturacak şekilde aracılık faaliyeti yürütmektedir.'),
                          Text(''),
                          Text(
                              '5.2 Platform hizmetlerinden faydalanmak üzere üyeliğini başlatan Danışan, Danışman ile arasında kurulacak olan sözleşmesel ilişki kapsamında işbu Kullanım Sözleşmesi’nde belirtilen şartları kabul etmektedir.'),
                          Text(''),
                          Text(
                              '5.3 Danışan, Psikolook’un Platform hizmeti kapsamında aracılık hizmeti sunduğu ve Danışman ile arasında kurulacak olan sözleşmeye Psikolook’un taraf olmadığını bilmektedir.'),
                          Text(''),
                          Text(
                              '5.4 Kurulacak olan sözleşmesel ilişkisinin tarafları Danışan ve Danışman olup Psikolook sadece 5. başlıkta açıklanan Platform aracılık hizmetinden kaynaklanan yükümlülüklere sahiptir.'),
                          Text(''),
                          Text(
                              '5.5 Danışan istediği zaman hizmet aldığı Danışman’ı değiştirebileceği gibi Platform üyeliğini sonlandırma imkânına da sahiptir. '),
                          Text(''),
                          Text(
                              '5.6 Psikolook’un uygulamadaki her türlü içeriği veya uygulama içi hizmetlerini, herhangi bir bildirime gerek duymaksızın değiştirme veya kaldırma hakkı saklıdır.'),
                          Text(''),
                          Text(
                              '5.7 Danışan’lar tercih ettikleri bir rumuz vasıtasıyla Danışman’lardan alacağı hizmet sırasında anonim kalma hakkına sahiptir.'),
                          Text(''),
                          Text(
                              '5.8 Seans randevusu alınabilmesi için öncelikle ilgili ücretin ödenmiş olması gerekmektedir. Afet durumları ve referans koduyla ücretsiz terapi alanlar hariçtir.'),
                          Text(''),
                          Text(
                              '5.9 Psikolook üzerinden yapılacak her türlü bilgi, dokuman, hizmet, yazı, ifade ve benzeri paylaşımlarla ilgili sorumluluk bu paylaşımları yapan Danışan veya Danışman’a ait olup içerikler hakkında Psikolook’un denetim veya sorumluluğu bulunmamaktadır.'),
                          Text(''),
                          Text(
                            "5.10 Taraflar, Platform’un uygulamasında çalışma, geliştirme, güncelleme veya bakım gibi faaliyetlerin gerçekleştirilmesi halinde hizmetin geçici olarak durdurulabilme yetkisini kabul etmektedir.\n\n5.11 Randevu saatlerine riayet edilmemesi halinde ücret iadesi söz konusu olmayacaktır. Bu bakımdan geç kalan veya randevuya katılmayan Danışan ek süre veya ücret iadesi ya da sair bir talepte bulunamayacaktır.\n\n5.12 Randevuların iptal edilmesi mümkün olup ancak randevu saatinden en geç 24 saat önce bildirilmesi kaydıyla sonuç doğuracaktır. Başka herhangi bir sebeple iade mümkün olmayacaktır.\n\n5.13 Uygulamada yer alan hizmet özellik bilgileri ile fiyat bilgilerinde hata olduğu takdirde Platform tarafından gerekli bilgilendirme yapılarak düzeltme yapılmış bir biçimde güncelleme veya hizmet iptali yapılması mümkündür.\n\n5.14 Danışman sözleşme karşılığı ödenecek ücretlerin kendi nam ve hesabına kabul edilmesi için Psikolook'u yetkilendirmiş olup ödemelerin temsilci sıfatıyla Psikolook'a yapılmasıyla birlikte Danışan’ın ödeme borcu sona erecektir. Ödeme işlemleri bakımından Psikolook mevzuat gereği yetkili sayılan ödeme hizmet sağlayıcılarından tercih ettiği ile çalışma imkânına sahiptir.\n\n5.15. Seansların paket halinde alınması mümkündür. Bu kapsamda Danışan dilediği zaman seansların rezervasyonlarını oluşturabilecek olup 3’lü paketlerde 30 gün içinde, 5’li paketlerde 45 gün içinde, 7’li paketlerde ise 60 gün içinde iptal talebinde bulunabilecek ve iade talep edebilecektir. Bu durumda indirimli fiyat ve indirimsiz fiyat arasındaki fark cezai şart teşkil edecektir. Ancak 14 gün içerisinde cayma hakkının kullanılması halinde herhangi bir cezai şart uygulanmayacaktır.",
                          ),
                          Text(''),
                          Text(
                            '6. PLATFORM HİZMETLERİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "6.1 İşbu sözleşmenin tarafları Danışan ve Danışman’dan ibarettir. Psikolok sözleşme tarafı olmayıp Taraflar arasındaki çevrimiçi aracılık hizmetlerini sunmaktadır. \n\n6.2 Danışman’lar tarafından sağlanacak olan hizmetin kalitesi veya niteliğine ilişkin Psikolook tarafından garanti veya nitelik vaadi verilmemekte olup böyle bir gerekçe ile Psikolook'a sorumluluk yöneltilemez. Danışman’ın kusuru sebebiyle doğan zararlarda sözleşmenin tarafı olması sebebiyle Danışman bizzat sorumlu olup Psikolook'a herhangi bir gerekçeyle rücu etme hakkı bulunmamaktadır.\n\n6.3 Psikolook içinde yayımlanan Danışman bilgileri bizzat Danışman’lar tarafından doldurulmakta olup Psikolook'un bilgilerin doğruluğu veya güncelliği hakkında bir sorumluluğu bulunmamaktadır. Bilgilerin güncel ve doğru hali bildirildiği takdirde gerekli değişiklikler gecikmeksizin yapılacaktır.\n\n6.4 Danışmanlar tarafından verilecek tavsiye, tedavi, yönlendirme, öneri veya benzeri davranışlar hiçbir şekilde Psikolook açısından bağlayıcılık arz etmeyeceği gibi sorumluluk kaynağı sayılmaz.\n\n6.5 Psikolook kullanmış olduğu yazılımların güvenliği açısından her türlü tedbiri almayı ve zaman içerisinde ortaya çıkabilecek olası eksiklik ve açıkları gidermeyi taahhüt etmektedir. Ancak doğası gereği internet bağlantılı yazılım ve servisler için %100 bir güvenlik sağlanamayacak olması sebebiyle herhangi bir kusurun olmadığı –örneğin mekanik, elektronik veya iletişimsel arıza veya bozulma halleri gibi Psikolook'un inisiyatifi dışında gerçekleşen- durumlarda Psikolook'un sorumluluğu gündeme gelmeyecektir.\n\n6.6. Danışman’ın platforma hizmet sunmaktan vazgeçmesi halinde, Danışan, ödemiş olduğu meblağ tutarında kendisine para iadesi yapılacağını kabul, beyan ve taahhüt eder."),
                          Text(''),
                          Text(
                            '7. DANIŞMANIN YÜKÜMLÜLÜKLERİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '7.1 Danışman yüz yüze terapiler için geçerli olan etik kuralları da dâhil olmak üzere sunduğu psikolojik danışmanlık hizmetine ilişkin geçerli tüm mevzuata uymayı taahhüt etmektedir.\n\n7.2 Danışman ilaç tedavisine başlama veya sona erdirme kararları dâhil olmak üzere, herhangi bir medikal tedavi uygulaması veya medikal tedavi tavsiyesinde bulunmayacaktır.\n\n7.3 Danışman, Danışan’ın 7.2. maddede yer alan hastalık bilgilendirmesini yapması ve aksi takdirde bu sebeple danışmanlık hizmetinde hata riski oluşacağı konusunda Danışan’ı aydınlatacaktır.'),
                          Text(''),
                          Text(
                            '8. DANIŞANIN YÜKÜMLÜLÜKLERİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "8.1 Danışan, Danışman tarafından Platform aracılığıyla sunulan çevrimiçi psikolojik danışmanlık hizmetlerine ilişkin aşağıdaki hususların bilincinde olduğunu beyan ve taahhüt etmektedir:\na )Çevrimiçi danışmanlık yüz yüze psikolojik hizmet yerine geçmemektedir.\n\nb) Çevrimiçi danışmanlık doğrudan veya dolaylı olarak teşhis veya tedavi amacı gütmediği gibi tıbbi bir tedavi hizmeti niteliği taşımamaktadır.\n\n8.2 Danışan daha önce geçirmiş olduğu hastalıklar ve kullanmış olduğu ilaçlar dâhil olmak üzere Danışman’ın sunacağı hizmet sırasında dikkate alması gereken her türlü bilgiyi eksiksiz olarak Danışman’la paylaşmakla yükümlüdür. Bu yükümlülüğün ihlali halinde sorumluluk kusurları oranında Danışan ve Danışman üzerinde olup aracılık hizmeti sunan Platform’un herhangi bir sorumluluğu doğmayacaktır.\n\n8.3 Danışan 8. Maddede yer alan Üyelik Şartlarını eksiksiz bir biçimde taşıdığını beyan ve taahhüt etmekte olup aksi durumun anlaşılması halinde kendisine hizmet verilmeyeceğini ve olası tüm zararlardan sorumlu olacağını kabul etmektedir.\n\n8.4 Hizmetten faydalanabilmek için öncelikle, Platform’da duyurulan danışmanlık ücretinin ödenmiş olması gerekmektedir. Danışan Platform’da yer alan ücretin herhangi bir zamanda tek taraflı olarak güncellenebileceğini kabul, beyan ve taahhüt eder.\n\n8.5 Danışan Danışman tarafından kendisine sunulan hizmetin ayıplı olduğunu tespit ettiği takdirde Danışman’a durumu en kısa sürede bildirmekle yükümlüdür.  Benzer şekilde Danışan, Danışman’un uzmanlığından şüphe ettiği veya hizmetin ayıplı olduğu durumlarda Psikolook'a da sunduğu Platform hizmetinin kalitesini koruyabilmesi için gecikmeksizin bilgi vermekle yükümlüdür.\n\n8.6 Danışan aşağıdaki fiilleri gerçekleştirmeyeceğini kabul, beyan ve taahhüt eder:\na) Danışman’lara sosyal medya hesaplarından ulaşmak, mesaj atmak, herhangi bir suretle Platform izni olmaksızın haricen iletişime geçmek,\nb) Maddi çıkar sağlamak amacıyla para istemek, banka hesap bilgisi paylaşmak ve benzer fiiller,\nc) Başka site, marka, ürün, hizmet ve benzer içerik hakkında reklam ve tanıtım faaliyeti yapmak\n\n8.7 Danışan 7.6. maddede yer alan yükümlülüklerin ihlali halinde oluşacak zarardan sorumlu olduğunu ve Psikolook'un olası bir sorumluluktan kurtarmayı kabul, beyan ve taahhüt eder. Buna ek olarak Psikolook'un aykırı davranış sergileyen Danışan’ları sistemden çıkarma ve engelleme hakları saklıdır."),
                          Text(''),
                          Text(
                            '9. ÜYELİK ŞARTLARI',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "9.1 Aşağıda yer alan şartları sağlamayan kişiler Psikolook'a üye olamaz ve platform üzerinden Danışan sıfatıyla hizmet alamaz:\na) 18 yaşını doldurmuş olmak,\nb) Fiil ehliyetine sahip olmak,\nc) Daha önce herhangi bir sebeple Üyelik’ten uzaklaştırılmamak,\nd) Yasal yükümlülükleri yerine getirmek,\ne) Ağır ruhsal bozukluk, psikoterapi gerektiren bir durum, ilaç tedavisi gerektiren psikiyatrik sorun, intihar eğilimi ve sair özellikler taşımamak\n\n9.2 Danışan, Üyelik kapsamında seçeceği kullanıcı adını genel ahlak kuralları ile başta telif, marka ve ticaret unvanı dâhil olmak üzere ancak bunlarla sınırlı olmamak kaydıyla üçüncü kişi haklarını ihlal etmeyecek biçimde seçmekle yükümlüdür.\n\n9.3 Danışan, Üyelik Şartları bakımından yanıltıcı bilgi verdiği takdirde, Danışman’ın hizmeti kesme ve ücreti iade etmeme hakkı bulunmaktadır.\n\n9.4 Platform faaliyeti kapsamında aracılık hizmeti sağlayan Psikolook'un yukarıda yer alan üyelik şartlarına ek olarak yasal veya ticari menfaat ve tercihler kapsamında üye kabulünde takdir hakkı saklıdır.\n\n9.5 Danışan Platforma üye olurken paylaşması gereken ad, soyad, telefon ve talep edilecek diğer gerekli bilgilerin tam ve eksiksiz vermekle yükümlü olup bu bilgilerin doğru olduğunu ve bu bilgileri güncel tutacağını taahhüt eder. Girilen bilgilerin eksikliği veya doğrulanamaması halinde Psikolook'un Danışan’a sunulacak hizmet sonlandırma hakkına sahiptir."),
                          Text(''),
                          Text(
                            '10. HİZMETİN ŞAHSİLİĞİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '10.1 Sunulan çevrimiçi psikolojik danışmanlık hizmeti Danışan’ın şahsına münhasır olup şahsilik arz etmektedir. \n\n10.2 Platformda yer alan kullanım paketleri tek bir Danışan’ın kullanımını kapsamakta olup kullanım hakkı hiçbir surette üçüncü bir şahsa devredilemez.\n\n10.3 Her bir Danışan azami tek bir hesap açabilecek olup mükerrer açılan hesaplar herhangi bir uyarıya gerek kalmaksızın Psikolook tarafından kapatılacaktır.'),
                          Text(''),
                          Text(
                            '11. FİKRİ HAKLAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "11.1 Hizmet içeriğinin tamamı, yazılımlar, konsept, tasarım, fotoğraflar ve diğer detaylara ilişkin olmak üzere her türlü telif, marka, patent ve diğer gayrımaddi haklar maddi ve manevi boyutlarıyla ve kullanım haklarını da kapsayacak şekilde yalnızca Psikolook Teknoloji Anonim Şirketi’ne ait olup Taraflar bunlara ilişkin kopyalama, izinsiz kullanım, çoğaltma, pazarlama, dağıtma, iletme, mühendislik, tersine mühendislik ve benzeri faaliyetlerde bulunmayacağını kabul, beyan ve taahhüt eder."),
                          Text(
                            '12. SÖZLEŞMENİN BÖLÜNEBİLİRLİĞİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "12. 1 Taraflar, işbu Sözleşme’nin herhangi bir hükmü geçersiz addedilirse bu geçersizlik Sözleşme’nin geri kalan hükümlerinin geçerliliğini koruyacağını kabul ve beyan etmektedir."),
                          Text(''),
                          Text(
                            '13. MÜCBİR SEBEP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '13.1 İlgili Taraf’ın makul kontrolü ve gerekli özeni göstermesine rağmen önceden öngöremeyeceği ve önleyemeyeceği –örneğin sayılanlarla sınırlı olmamak kaydıyla doğal afet, isyan, savaş, grev, iletişim, altyapı ve internet arızaları, elektrik kesintisi- mücbir sebep sayılan tüm durumlarda, Taraflar taahhütlerinin gereği gibi ifa edilememesi nedeniyle sorumlu olmayacaktır.\n13.2 Mücbir sebeplerin varlığı halinde, diğer Taraf’a 15 (on beş) gün içerisinde yapılacak bildirim ile Sözleşme hükümleri askıya alma; mücbir sebep durumunun üç aydan fazla sürmesi halinde ise Taraflar Sözleşme’yi fesih hakkına sahiptir'),
                          Text(''),
                          Text(
                            '14. YETKİ SÖZLEŞMESİ VE HUKUK SEÇİMİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '14.1 Taraflar işbu Sözleşme’den doğabilecek ihtilaflarda Türk Hukuku’nun uygulanmasını ve her türlü uyuşmazlık çözümünde İstanbul (Çağlayan) Mahkemesi ile İcra Dairelerinin yetkili olduğunu kabul etmiştir.'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Okudum, onaylıyorum',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: userContract,
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          userContract = value;
                        });
                      },
                    ),
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
