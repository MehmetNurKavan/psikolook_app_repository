import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class DateTimeCard extends StatefulWidget {
  final snap;
  const DateTimeCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<DateTimeCard> createState() => _DateTimeCardState();
}

class _DateTimeCardState extends State<DateTimeCard> {
  @override
  void initState() {
    super.initState();
  }

  deleteDate(String dateId) async {
    try {
      await FireStoreMethods().deleteDate(dateId);
      showSnackBar(context, 'Seans Kaldırıldı!');
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
              activeColor: const Color(0xFF6EAECC),
              value: !widget.snap['isVisible'],
              onChanged: (bool? value) {
                setState(() {});
              },
            ),
            widget.snap['isVolunteer'] != null?
            widget.snap['isVolunteer'] == true?
            Image.asset('assets/images/heart.png', width: 25): const SizedBox(width: 25.0): const SizedBox(width: 25.0),
          ],
        ),
        IconButton(
          onPressed: () {
            showDialog(
              useRootNavigator: false,
              context: context,
              builder: (context) {
                return Dialog(
                  child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shrinkWrap: true,
                      children: ['Kaldır !']
                          .map(
                            (e) => InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Text(e),
                                ),
                                onTap: () {
                                  deleteDate(
                                    widget.snap['dateId'].toString(),
                                  );
                                  // remove the dialog box
                                  Navigator.of(context).pop();
                                }),
                          )
                          .toList()),
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
