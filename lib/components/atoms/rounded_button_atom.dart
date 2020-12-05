import 'package:flutter/material.dart';
import 'package:stax/services/themer.dart';

class RoundedButtonAtom extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const RoundedButtonAtom({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Themer.instance.radius1),
          side: BorderSide(
              color: Themer.instance.palette.onDarkCardPrimary)),
      onPressed: onPressed,
      child: Text(title,
          style: TextStyle(
              color: Themer.instance.palette.onDarkCardPrimary)),
    );
  }
}
