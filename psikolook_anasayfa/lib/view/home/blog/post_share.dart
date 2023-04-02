import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/providers/user_provider.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
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
        uid,
        username,
        profImage,
        _postTextController.text,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
          Navigator.pop(context);
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
    _postTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PsikologUserProvider userProvider = Provider.of<PsikologUserProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: ListView(
          primary: false,
          children: [
            SizedBox(height: height * 0.075),
            barField(), //0.1
            SizedBox(height: height * 0.05),
            startWrite("Yazmaya başla..."), //0.6
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 44.0),
                  child: ElevatedButton(
                      onPressed: () => sharePost(
                            userProvider.getUser.uid,
                            userProvider.getUser.username,
                            userProvider.getUser.photoUrl,
                          ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
            const SizedBox(height: 50),
            isLoading ? const LinearProgressIndicator() : Container(),
          ],
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
          "Paylaşım Yap",
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

  Widget startWrite(String hintText) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(17)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: TextFormField(
            maxLength: 280,
            controller: _postTextController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: textStyle.startWriteBlogHintStyle),
            maxLines: null,
            minLines: 7,
          ),
        ),
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
