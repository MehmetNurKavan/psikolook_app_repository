import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/utils/customTextStyle.dart';

class BlogShare extends StatefulWidget {
  const BlogShare({Key? key}) : super(key: key);

  @override
  State<BlogShare> createState() => _BlogShareState();
}

class _BlogShareState extends State<BlogShare> {
  bool isLoading = false;
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _blogTextController = TextEditingController();
  final TextEditingController _blogTimeController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Resim seçiniz'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Fotoğraf Çek'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Galeriden Seç'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("İptal"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void shareBlogs(
    String uid,
    String username,
    String profImage,
  ) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadBlog(
        _descriptionController.text,
        _file!,
        uid,
        username,
        _blogTextController.text,
        _blogTimeController.text,
        profImage
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Paylaşıldı!!',
        );
        clearImage();
        Navigator.pop(context);
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  var userData = {};
  
    @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('PsikologUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _blogTextController.dispose();
    _blogTimeController.dispose();
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
        child: _file == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            closeIconButton(),
                          ]),
                    ),
                    const Text(('Blog Yazısı Yaz'),
                        style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(('Harika!'),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                                ('Blog yazınız için\nbir fotoğraf seçiniz!'),
                                style: TextStyle(fontSize: 18)),
                            SizedBox(
                              child: IconButton(
                                iconSize: 125,
                                icon: Image.asset(
                                    'assets/images/gallery_photo.png'),
                                onPressed: () => _selectImage(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 81.7,
                    ),
                    barField(),
                    const SizedBox(
                      height: 53,
                    ),
                    textField("Başlığını Buraya Yaz"),
                    const SizedBox(
                      height: 61,
                    ),
                    imageBox(),
                    const SizedBox(
                      height: 44,
                    ),
                    startWrite("Yazmaya başla..."),
                    const SizedBox(
                      height: 17,
                    ),
                    minuteWrite(),
                    const SizedBox(
                      height: 29,
                    ),
                    /* okElevatedButton(userProvider), */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 44.0),
                          child: ElevatedButton(
                              onPressed: () {
                                showLoaderDialog(context);
                                shareBlogs(
                                  userData['uid'],
                                  userData['username'],
                                  userData['photoUrl'],
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                              bottomLeft:
                                                  Radius.circular(22)))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              child: const Text(
                                "TAMAM",
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    isLoading ? const LinearProgressIndicator() : Container(),
                  ],
                ),
              ),
      ),
    );
  }

//close icon ve "blog yazısı yaz" kısmını içeriyor..
  Row barField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.2),
        const Text(
          "Blog Yazısı Yaz",
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
        closeIconButton(),
      ],
    );
  }

  Widget minuteWrite() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(17)),
      child: TextFormField(
        controller: _blogTimeController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Yazın kaç dakikada okunuyor?",
            suffixText: 'dkk ',
            hintStyle: TextStyle(color: Color(0xFF66889B), fontSize: 18)),
      ),
    );
  }

  Widget startWrite(String hintText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(17)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: TextFormField(
          controller: _blogTextController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: textStyle.startWriteBlogHintStyle),
          maxLines: null,
          minLines: 15,
        ),
      ),
    );
  }

  Padding imageBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: FractionalOffset.topCenter,
            image: MemoryImage(_file!),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => _selectImage(context),
                    icon: const Icon(
                      Icons.image_rounded,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                      size: 29,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textField(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56.0),
      child: TextField(
        controller: _descriptionController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: textStyle.textFieldHintStyle,
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: CustomColors.textFieldColor))),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 30,
      ),
    );
  }
}
