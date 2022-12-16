import 'package:flutter/material.dart';

import 'basliik_kartlari.dart';
import 'very_soon1.dart';


class very_soon8 extends StatelessWidget {
  const very_soon8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => very_soon1(),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, right: 20),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.manage_search_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Konular",
                    style: TextStyle(fontSize: 40, color: Colors.yellow),
                  ),
                ],
              ),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
              konu_kartlari(),
            ],
          ),
        ));
  }
}
