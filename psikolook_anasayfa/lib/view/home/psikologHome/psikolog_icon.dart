import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PsikolookIcon extends StatefulWidget {
  const PsikolookIcon({super.key});

  @override
  State<PsikolookIcon> createState() => _PsikolookIconState();
}

class _PsikolookIconState extends State<PsikolookIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(
            color: Colors.black,
            endIndent: MediaQuery.of(context).size.width * 0.15,
            thickness: 1.1,
            indent: MediaQuery.of(context).size.width * 0.15,
          ),
        ],
      ),
    );
  }
}
