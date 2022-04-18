/* // ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {      
      return CupertinoButton(
        child: Text(label),
        onPressed: onPressed,
      );
    } else {
      var onPressed2 = onPressed;
      return RaisedButton(
        child: Text(label),
        onPressed: onPressed2,
      );
    }
  }
}
 */