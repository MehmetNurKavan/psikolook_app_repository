import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:psikolook_anasayfa/view/partner/payment/payment_page.dart';
import 'package:psikolook_anasayfa/view/partner/payment/payment_successful_page.dart';
import 'package:psikolook_anasayfa/view/psikologHome/blog/blog_page.dart';

class DateTimeCard2 extends StatefulWidget {
  final snap;
  final uid;
  const DateTimeCard2({
    Key? key,
    required this.snap,
    required this.uid,
  }) : super(key: key);

  @override
  State<DateTimeCard2> createState() => _DateTimeCard2State();
}

class _DateTimeCard2State extends State<DateTimeCard2> {
  bool isLoading = false;
  var userData = {};
  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('OtherUsers')
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
  void initState() {
    getData();
    super.initState();
  }

  updateDate(String dateId, String otherName, String otherUid,
      String otherPhotoUrlUrl) async {
    try {
      await FireStoreMethods()
          .updateDate(dateId, otherName, otherUid, otherPhotoUrlUrl);
      showSnackBar(context, 'Seans Seçildi!');
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  updateDate2(String dateId) async {
    try {
      await FireStoreMethods().updateDate2(dateId);
      showSnackBar(context, 'Seans İptal Edildi!');
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        Row(
          children: [
            Text(widget.snap['addDate'], style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 30),
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              checkColor: Colors.transparent,
              activeColor: blueColor,
              value: !widget.snap['isVisible'],
              onChanged: (bool? value) {
                setState(() {});
              },
            ),
          ],
        ),
        widget.snap['isVolunteer'] != null && widget.snap['isVolunteer'] == true
            ? Image.asset('assets/images/heart.png', width: 25)
            : const SizedBox(width: 25.0),
        (widget.snap['isVolunteer'] != null && true) &&
                (userData['castawayConfirmation'] != null && true)
            ? IconButton(
                onPressed: () {
                  showDialog(
                    useRootNavigator: false,
                    context: context,
                    builder: (context) {
                      return widget.snap['otherUid'] ==
                                  FirebaseAuth.instance.currentUser!.uid &&
                              !widget.snap['isVisible']
                          ? Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Görüşmeyi İptal Et!']
                                    .map(
                                      (e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                          onTap: () {
                                            updateDate2(widget.snap['dateId']
                                                .toString());
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                    .toList(),
                              ),
                            )
                          : Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Gönüllü Seansı Ekle!']
                                    .map(
                                      (e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                          onTap: () {
                                            updateDate(
                                              widget.snap['dateId'].toString(),
                                              userData['username'],
                                              userData['uid'],
                                              userData['photoUrl'],
                                            );
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                    .toList(),
                              ),
                            );
                    },
                  );
                },
                icon: const Icon(Icons.more_horiz, color: Colors.black38),
              )
            : IconButton(
                onPressed: () {
                  showDialog(
                    useRootNavigator: false,
                    context: context,
                    builder: (context) {
                      return widget.snap['otherUid'] ==
                                  FirebaseAuth.instance.currentUser!.uid &&
                              !widget.snap['isVisible']
                          ? Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Görüşmeyi İptal Et!']
                                    .map(
                                      (e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                          onTap: () {
                                            updateDate2(widget.snap['dateId']
                                                .toString());
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                    .toList(),
                              ),
                            )
                          : Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Seansı Ekle!']
                                    .map(
                                      (e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                          onTap: () {
                                            /* Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => PaymentPage(
                                            navigator:
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentSuccessfulPage(
                                                          snap: widget.snap,
                                                          uid: widget.uid)),
                                            ),
                                          ),
                                        ),
                                      ); */
                                            updateDate(
                                              widget.snap['dateId'].toString(),
                                              userData['username'],
                                              userData['uid'],
                                              userData['photoUrl'],
                                            );
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                    .toList(),
                              ),
                            );
                    },
                  );
                },
                icon: const Icon(Icons.more_horiz, color: Colors.black38),
              )
      ],
    );
  }
}
