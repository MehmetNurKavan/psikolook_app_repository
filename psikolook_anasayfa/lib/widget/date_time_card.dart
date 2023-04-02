/* //return  */
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/widget/blog_page.dart';

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

  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Text(widget.snap['addDate'], style: const TextStyle(fontSize: 28)),
            Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              checkColor: Colors.transparent,
              activeColor: Colors.black,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const SizedBox(),
          ],
        ),
        Text(widget.snap['dateDay'], style: const TextStyle(fontSize: 28)),
      ],
    );
  }
}
