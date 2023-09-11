import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/firestore_methods.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';

class AdminGroupCard extends StatefulWidget {
  final snap;
  const AdminGroupCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<AdminGroupCard> createState() => _AdminGroupCardState();
}

class _AdminGroupCardState extends State<AdminGroupCard> {
  @override
  void initState() {
    super.initState();
  }

  deleteGroup(String groupId,String toplulukTitle) async {
    try {
      String res = await FireStoreMethods().deleteToplulukGroup(groupId, toplulukTitle);
      if (res == "success") {
        showSnackBar(
          context,
          'Seçilen Topluluk Kaldırıldı!',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: cardBackgroundColor,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(22.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.65,
                child: Text(
                  widget.snap['toplulukTitle'],
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
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
                            children: ['Topluluğu Sil!']
                                .map(
                                  (e) => InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Text(e),
                                      ),
                                      onTap: () {
                                        deleteGroup(
                                          widget.snap['groupId'].toString(),
                                          widget.snap['toplulukTitle'].toString(),
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
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
