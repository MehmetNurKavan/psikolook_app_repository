import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/widget/textfield_widget.dart';

class UpdateCard extends StatelessWidget {
  final String describle;
  final String text;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function()? function;

  const UpdateCard({
    Key? key,
    required this.describle,
    required this.text,
    required this.controller,
    required this.function,
    this.keyboardType=TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(text)),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(describle),
                          const SizedBox(height: 5.0),
                          TextFieldWidget(
                            controller: controller,
                            hintText: text,
                            keyboardType: keyboardType,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: function,
                            child: const Text(
                              'Kaydet',
                              style: TextStyle(color: blueColor),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'iptal',
                              style: TextStyle(color: blueColor),
                            ))
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'düzenle',
                style: TextStyle(color: blueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
