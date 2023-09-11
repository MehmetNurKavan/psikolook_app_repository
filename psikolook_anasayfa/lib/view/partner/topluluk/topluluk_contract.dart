import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class ToplulukContrat extends StatefulWidget {
  const ToplulukContrat({Key? key}) : super(key: key);

  @override
  State<ToplulukContrat> createState() => _ToplulukContratState();
}

class _ToplulukContratState extends State<ToplulukContrat> {
  bool toplulukContract = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 30, left: 20.0, right: 20.0, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.small(
                    onPressed: () => Navigator.pop(context, toplulukContract),
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
                          'Topluluk Kuralları',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            '-Kullanıcıların birbirlerine karşı saygılı olması zorunludur.\n-Üyelerin birbirlerine yaptığı ırkçı, cinsiyetçi, homofobik ve küfürlü yorumlara müsamaha gösterilmeyecektir. Böyle durumda yorumlara müdahale edilecektir.\n-Kullanıcılar tarafından gelen, insanların dini inancına, ırkına, etnik kökenine, yaşına, sosyal durumuna, siyasi görüşüne, cinsel yönelimine, fiziksel durumuna göre kişilere veya belirli gruplara karşı nefrete teşvik edici, şiddet içeren, provokatif, aşağılayıcı içerik ve yorumları yayınlamama hakkını Psikolook saklı tutmaktadır.\n-Kullanıcı Sözleşmesini ihlal ederek diğer kullanıcıların kişisel bilgilerini ifşa eden, bu bilgileri kendi çıkarları için kullanan; tehdit, taciz gibi unsurları kullanarak, rahatsız edici bir biçimde diğer kullanıcıları sürekli takip eden ve insanları şiddete yönlendirmek adına başkalarını kışkırtan davranışlarda bulunan kullanıcıların hesapları kapatılacaktır.\n-Birey, kurum, kültür veya toplumları küçük düşürücü, küfür, aşağılama veya argo ifadelere izin verilmemektedir. Bu tür yorumların silinmesi, gerekli kişilere uyarı gönderilmesi ve/veya üyeliklerinin silinmesi hakkını Psikolook saklı tutmaktadır.\n-Daha sağlıklı bir tartışma ortamının olması için yapılan yorumlarda üyelerin, diğer kullanıcıların inançlarına ve görüşlerine saygı göstermeleri zorunludur.\n-Yapılan yorumlarda mümkün olduğu kadar yazım ve imla bilgisine önem verilmelidir. Bu nedenle anlaşılmayan yorumlarda, düzeltme ve silme hakkını Psikolook saklı tutmaktadır.\n-Herhangi bir ticari amaç ya da telif hakkı içeren yorumlara izin verilmeyecektir.\n-İnsanları kışkırtan, saldırgan bir kullanıcı adı seçilemez.\n-İçeriğin konusunda sapmayarak yapılan yorumlar olası tartışmaların engellenmesine yardımcı olacaktır. Aksi takdirde yorumlarınız Psikolook’un takdirine bağlı olarak silinebilir.\nÜyelerin kendi güvenlikleri açısından kişisel ve özel bilgilerini paylaşmaması gerekmektedir.\n-Psikolook kararı hakkında yapılan saldırgan yorumların silinme olasılığı vardır.\n-Psikolook çalışanlarına, hakaret ve küfür içeren özel mesaj atan kullanıcıların hesaplarını silme hakkını Psikolook saklı tutmaktadır.\n-Spam mesajlar göndermek yasaktır. Aynı ve benzer mesajlar birden fazla kere gönderildiğinde de müdahale edilecektir.\n-Yargı mercilerine saygısızlık içeren veya içerme ihtimali olan yorumlara müsamaha gösterilmez.\n-Yürümekte olan veya ileride başlayacak olan yargılama sürecini etkileyecek her şey bu kapsamdadır.'),
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
                    value: toplulukContract,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      setState(() {
                        toplulukContract = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
