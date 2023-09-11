import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class KvkkPage extends StatefulWidget {
  const KvkkPage({Key? key}) : super(key: key);

  @override
  State<KvkkPage> createState() => _KvkkPageState();
}

class _KvkkPageState extends State<KvkkPage> {
  bool kvkk = false;
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
                      onPressed: () => Navigator.pop(context, kvkk),
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
                            'KVKK METNİ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                            'KİŞİSEL VERİLERİN İŞLENMESİ HAKKINDA AYDINLATMA METNİ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(''),
                          Text(
                              'Bu bilgilendirme metni 6698 sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”) kapsamında Psikolook tarafından veri sorumlusu sıfatıyla, elde edilen kişisel verilerinize yönelik olarak bilgilendirme amacıyla hazırlanmıştır.'),
                          Text(''),
                          Text(
                            'I. Veri Sorumlusu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Hasan Kalyoncu Üniversitesi Psikolook projesi Havaalanı Yolu Üzeri 8. km, 27010 Şahinbey/Gaziantep'),
                          Text(''),
                          Text(
                            'II. Ürün/Hizmet Alımı Bağlamında İşlenen Kişisel Veriler',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Kişisel verileriniz Psikolook tarafından verilen hizmet ve ilgili mevzuattan kaynaklanan yasal yükümlülükler çerçevesinde, söz konusu amaç ve yasal yükümlülüklerini yerine getirebilmesi amacıyla işlenmektedir.'),
                          Text(''),
                          Text(
                            '1. Kişisel Veri Toplama Yöntemi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Kişisel verileriniz sözlü, yazılı veya elektronik ortamda; web sitemiz veya mobil uygulamamız üzerinden, telefon görüşmesi, e-potsa ve sair dijital kanallar, fiziksel ortamda iletilen belge içerikleri toplanabilmektedir'),
                          Text(''),
                          Text(
                            '2. Kişisel Veri Kategorileri',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Hizmetlerimizle bağlantılı olarak veya yasal yükümlülükler çerçevesinde: • Kimlik Verileri: ad, soyadı, cinsiyet, yaş, meslek, ünvan, çalışılan kurum, okulun adı, bölüm, sınıf, diploma , öğrenci belgesi • İletişim Bilgileri: telefon numarası, e-posta adresi • Şikayet (psikolojik destek alma nedeni)• Konum verileri'),
                          Text(''),
                          Text(
                            '3. Amaç',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Kişisel veriler, müşteri ve tedarikçi sözleşme süreçlerinin yönetimi ve sözleşmelerden kaynaklanan yükümlülüklerin yerine getirilmesi, hizmetlerimize ilişkin soru, talep ve şikâyetinizin işlemi, üyelik işlemleri, bilgi güvenliği süreçlerinin yürütülmesi, rapor alma ve analiz, web sitemizi geliştirme amaçlarıyla işlenebilecektir.Ayrıca, ticari faaliyet alanıyla ilgili çeşitli kanunların emredici hükümleri gereği resmi mercilerin talep ve denetimleri doğrultusunda gerekli bilgilerin temini, yasal yükümlülüklerin yerine getirilmesi gibi nedenlerle ve mevzuat hükümleri çerçevesinde kişisel veri işlemektedir.'),
                          Text(''),
                          Text(
                            '4. Hukuki sebep',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Kişisel verileriniz yukarıda da belirtildiği üzere Psikolook tarafından toplama amaçları doğrultusunda KVKK Madde 5 ve 6’da düzenlendiği üzere kanunlarda açıkça öngörülmesi, sözleşmenin kurulması ve ifası, bir hakkın tesisi, kullanılması ve korunması, projeye dahil olan yürütücü, araştırmacı, danışman ve Psikolook’un sözleşme ve ilgili mevzuattan kaynaklanan yasal yükümlülüklerini yerine getirebilmesi veya meşru menfaatine yönelik sebeplere dayanılarak işlenmektedir. Yukarıda sayılanlar dışında kişisel veri işlenmesi durumunda, veri sahibi kişinin açık rızası alınarak ve bu hukuki sebebe dayanılarak işlenmektedir.'),
                          Text(''),
                          Text(
                            '5. Kişisel Verilerin Aktarılması',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Kişisel verileriniz KVKK Madde 8 ve 9 dahilinde, Kanun ve ilgili mevzuat kapsamında ve yukarıda belirtilen işleme amaçlarına bağlı olarak ve ayrıca kullanıcı kimliklerini doğrulamak ve destek hizmeti sunmak üzere hizmet sağlayıcılar, yazılım şirketleri gibi üçüncü gerçek ve/veya tüzel kişiler ile ve yasal zorunluluklar kapsamında yetkili kurum ve kuruluşları ile paylaşılabilmektedir.'),
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
                      value: kvkk,
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          kvkk = value;
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
