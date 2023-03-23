import 'package:flutter/material.dart';

class TextWithExponent extends StatelessWidget {
  final String text;
  final String exponentText;
  final double textSize;
  final double exponentTextSize;

  const TextWithExponent(this.text, this.exponentText,
      {Key? key, this.textSize = 25.0, this.exponentTextSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: textSize, color: Colors.white),
        ),
        Container(
          child: Text(exponentText,
              style:
                  TextStyle(fontSize: exponentTextSize, color: Colors.white)),
          margin: EdgeInsets.only(bottom: (textSize - exponentTextSize)),
        ),
      ],
    );
  }
}
