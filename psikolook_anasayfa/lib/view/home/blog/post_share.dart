import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/providers/user_provider.dart';
import 'package:psikolook_anasayfa/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customTextStyle.dart';

class PostShare extends StatefulWidget {
  const PostShare({Key? key}) : super(key: key);

  @override
  State<PostShare> createState() => _PostShareState();
}

class _PostShareState extends State<PostShare> {
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postTextController = TextEditingController();
  void sharePost(
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
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        uid,
        username,
        profImage,
        _postTextController.text,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Paylaşıldı!!',
        );
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

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _postTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 236, 241),
              Color.fromARGB(255, 254, 243, 244),
              Color.fromARGB(255, 255, 248, 245),
              Color.fromARGB(255, 255, 252, 247),
            ],
          ),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            children: [
              isLoading ? const LinearProgressIndicator() : Container(),
              SizedBox(height: height * 0.05),
              barField(), //0.1
              SizedBox(height: height * 0.025),
              textField("Başlığını Buraya Yaz"), //0.1
              SizedBox(height: height * 0.025),
              startWrite("Yazmaya başla..."), //0.6
              SizedBox(height: height * 0.025),
              /*  okElevatedButton(userProvider), */
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 44.0),
                    child: ElevatedButton(
                        onPressed: () => sharePost(
                              userProvider.getUser.uid ,
                              userProvider.getUser.username,
                              userProvider.getUser.photoUrl,
                            ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22),
                                        topRight: Radius.circular(22),
                                        bottomLeft: Radius.circular(22)))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: const Text(
                          "TAMAM",
                          style: TextStyle(fontSize: 25),
                        )),
                  ),
                ],
              ),
              //SizedBox(height: _hight * 0.025),
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

  /* Row okElevatedButton(userProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 44.0),
          child: ElevatedButton(
              onPressed: () => sharePost(
                    userProvider.getUser.username,
                    userProvider.getUser.uid,
                    userProvider.getUser.photoUrl,
                  ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22)))),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: const Text(
                "TAMAM",
                style: TextStyle(fontSize: 25),
              )),
        ),
      ],
    );
  } */

  Padding startWrite(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: Expanded(
        child: Container(
          width: 358,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: TextFormField(
              controller: _postTextController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: textStyle.startWriteBlogHintStyle),
              maxLines: null,
              minLines: 15,
            ),
          ),
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
        iconSize: 35,
      ),
    );
  }
}
