import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class HelpMePage extends StatefulWidget {
  const HelpMePage({Key? key}) : super(key: key);

  @override
  State<HelpMePage> createState() => _HelpMePageState();
}

class _HelpMePageState extends State<HelpMePage> {
  bool isCastaway = false;
  Uint8List? _castawayFile;

  Future selectedFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File pick = File(result.files.single.path.toString());
      _castawayFile = pick.readAsBytesSync();
      return _castawayFile;
    }
    if (result == null) return;
  }

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
              top: 50, left: 20.0, right: 20.0, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton.small(
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'geri',
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black, size: 30),
                  ),
                ],
              ),
              Card(
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
                          'Ücretsiz Psikolojik Destek\n',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Depremden etkilenen 11 ilimiz\nADANA\nADIYAMAN\nDİYARBAKIR\nELAZIĞ\nGAZİ ANTEP\nHATAY\nŞANLI URFA\nKAHRAMAN MARAŞ\nKİLİS\nMALATYA\nOSMANİYE\n\nDepremin etkilediği 11 ilde ikamet eden depremzedelerin ücretsiz bir şekilde psikolojik destek alması için E-Devlet üzerinden ikametgah belgesini edinip aşağıya yüklemesi gerekmektedir.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: TextButton(
                      onPressed: selectedFile,
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 50.0, right: 50.0, bottom: 10.0, top: 10.0),
                        child: Text('İkametgah Belgenizi Seçiniz',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  _castawayFile == null
                      ? Container()
                      : const Icon(Icons.file_download_done,
                          size: 34, color: pinkColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'İhtiyaç sahibi olduğumu ve ikametgah belgesini kendi iznimle paylaştığımı kabul ediyorum',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Switch(
                    value: isCastaway,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      setState(() {
                        isCastaway = value;
                      });
                    },
                  ),
                ],
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  isCastaway && _castawayFile != null
                      ? Navigator.pop(context, _castawayFile)
                      : showSnackBar(context,
                          'İhtiyac Sahibi Onay butonunu onayladığınızı ve pdfi yüklediğinize emin olunuz');
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 3.0, bottom: 3.0, right: 30.0, left: 30.0),
                  child: Text('Kaydet', style: TextStyle(color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
