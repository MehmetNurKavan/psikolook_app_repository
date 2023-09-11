import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  Color iconColor;
  Color backgroundColor;
  BackIconButton({Key? key,  this.iconColor=Colors.black, this.backgroundColor=Colors.transparent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () => Navigator.of(context).pop(),
      tooltip: 'geri',
      elevation: 0,
      backgroundColor: backgroundColor,
      child: Icon(Icons.arrow_back_ios_new, size: 30, color: iconColor),
    );
  }
}
