/* import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  @override
  Widget build(BuildContext context) {
   Future<void> _selectDate(BuildContext context) async {
DateTime? picked = await showDatePicker(
      context: context,
    builder: (BuildContext context, Widget ?child) {
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.grey,
          splashColor: Colors.black,
          textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.black),
          ),
          accentColor: Colors.black,
          colorScheme: ColorScheme.light(
              primary: Color(0xffffbc00),
              primaryVariant: Colors.black,
              secondaryVariant: Colors.black,
              onSecondary: Colors.black,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.black,
              secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
        ),
        child: child ??Text(""),
      );
    }
    initialDate: selectedDate,
    firstDate: DateTime(1960, 8),
    lastDate: DateTime.now());
if (picked != null && picked != selectedDate)
  setState(() {
    selectedDate = picked;


    String da = picked.day.toString() +
        "-" +
        picked.month.toString() +
        "-" +
        picked.year.toString();
    dateOfBirth.text = da;
  
  },);
  }
}
} */