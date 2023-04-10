/* //return  */
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/widget/blog_page.dart';

class DateTimeCard2 extends StatefulWidget {
  final snap;
  const DateTimeCard2({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<DateTimeCard2> createState() => _DateTimeCard2State();
}

class _DateTimeCard2State extends State<DateTimeCard2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.snap['addDate'], style: const TextStyle(fontSize: 28)),
        const SizedBox(width: 30),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.transparent,
          activeColor: const Color(0xFF6EAECC),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const SizedBox(),
      ],
    );
  }
}
